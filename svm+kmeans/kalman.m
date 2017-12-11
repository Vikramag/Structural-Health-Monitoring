%% Simulate the true signal and measurement
% Define the system
N = 1000; % number of time steps
dt = 0.001; % Sampling time (s)
t = dt*(1:N); % time vector (s)
F = [1, dt; 0, 1]; % system matrix - state
G = [-1/2*dt^2; -dt]; % system matrix - input
H = [1 0]; % observation matrix
Q = [0, 0; 0, 0]; % process noise covariance
u = 9.80665; % input = acceleration due to gravity (m/s^2)
I = eye(2); % identity matrix
% Define the initial position and velocity
y0 = 100; % m
v0 = 0; % m/s
% Initialize the state vector (true state)
xt = zeros(2, N); % True state vector
xt(:, 1) = [y0; v0]; % True intial state
% Loop through and calculate the state
for k = 2:N
% Propagate the states through the prediction equations
xt(:, k) = F*xt(:, k-1) + G*u;
end
% Generate the noisy measurement from the true state
R = 4; % m^2/s^2
v = sqrt(R)*randn(1, N); % measurement noise
z = H*xt + v; % noisy measurement
%% Perform the Kalman filter estimation
% Initialize the state vector (estimated state)
x = zeros(2, N); % Estimated state vector
x(:, 1) = [105; 0]; % Guess for initial state
% Initialize the covariance matrix
P = [10, 0; 0, 0.01]; % Covariance for initial state error
% Loop through and perform the Kalman filter equations recursively
for k = 2:N
% Predict the state vector
x(:, k) = F*x(:, k-1) + G*u;
% Predict the covariance
P = F*P*F' + Q;
% Calculate the Kalman gain matrix
K = P*H'/(H*P*H' + R);
% Update the state vector
x(:,k) = x(:,k) + K*(z(k) - H*x(:,k));
% Update the covariance
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