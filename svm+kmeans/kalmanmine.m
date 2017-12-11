

N=1000;
dt = 0.001;
t = dt*(1:N);
F = [1 dt; 0 1];
G = [-0.5*dt^2; -dt];
H = [1 0];
Q = zeros(2,2);
u= 9.80665;

I = eye(2);
y0 = 100; % m
v0 = 0; % m/s
xt = zeros(2,N);
xt(:, 1) = [y0; v0];

for k = 2:N
    xt(:,k)= F*xt(:,k-1)+ G*u;
end
R = 4; % m^2/s^2
v = sqrt(R)*randn(1, N); % measurement noise
z = H*xt + v; % noisy measurement


%% kalman filter estimation
x = zeros(2,N);
x(:,1) = [105; 0];
P = [10 0; 0 0.01];



for k = 2:N
    x(:,k)= F*x(:,k-1)+ G*u;
    P = F*P*F' + Q;
    K = P*H'/(H*P*H'+R);
        
    x(:,k)=x(:,k)+K*(z(k)-H*x(:,k));
    P = (I - K*H)*P;

end


%% Plot the results
% Plot the states
figure(1);
subplot(211);
plot(t, z, 'g-', t, x(1,:), 'b--', 'LineWidth', 2);
hold on; plot(t, xt(1,:), 'r:', 'LineWidth', 1.5)
xlabel('t (s)'); ylabel('x_1 = h (m)'); grid on;
legend('Measured','Estimated','True');
subplot(212);
plot(t, x(2,:), 'b--', 'LineWidth', 2);
hold on; plot(t, xt(2,:), 'r:', 'LineWidth', 1.5)
xlabel('t (s)'); ylabel('x_2 = v (m/s)'); grid on;
legend('Estimated','True');
% Plot the estimation errors
figure(2);
subplot(211);
plot(t, x(1,:)-xt(1,:), 'm', 'LineWidth', 2)
xlabel('t (s)'); ylabel('\Deltax_1 (m)'); grid on;
subplot(212);
plot(t, x(2,:)-xt(2,:), 'm', 'LineWidth', 2)
xlabel('t (s)'); ylabel('\Deltax_2 (m/s)'); grid on;
