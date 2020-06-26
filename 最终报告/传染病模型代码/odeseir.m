%% ------------------------------------------------------------------------
function dy = odeseir(t,y, beta, gamma, alpha, N)
dy = [ -beta*y(1)*y(2)/N;  
        beta*y(1)*y(2)/N - alpha*y(2);
        alpha*y(2)       - gamma*y(3)
                           gamma*y(3)];
end
