function comparison(modelsvm,model)


mini1 = min(abs(model.Beta));
mini2 = min(abs(modelsvm.Beta));
a = model.Beta/mini1;
 
c = modelsvm.Beta/mini2 ;

margin_matlab_code = 2/(a'*a)^0.5
margin_my_code = 2/(c'*c)^0.5