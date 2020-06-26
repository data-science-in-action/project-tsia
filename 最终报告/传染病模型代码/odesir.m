

function dy = odesir(t, y, beta, gamma, N)
dy = [ -beta*y(1)*y(2)/N;                 
        beta*y(1)*y(2)/N - gamma*y(2);
                           gamma*y(2)];
