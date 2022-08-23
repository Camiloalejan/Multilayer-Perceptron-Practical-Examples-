function [w, ws] = MLP (x,w,ws,d,m,n,eta)

wo1 = w(1:2);
wo2 = w(3:4);
wo3 = w(5:6);

for i = 1:m
    for k = 1:length(x)
        % FEED FORWARD
        xo = [1 x(k)]';
        xs = [1, tanh(wo1'*xo), tanh(wo2'*xo), tanh(wo3'*xo)]';
        y = ws'*xs;
        e(k) = d(k) - y; % Error
        
        % BACK PROPAGATION
        ds(k) = e(k);
        for j = 2:n+1
            do(j-1) = ((1-xs(j))*(1+xs(j)))*(ws(j)*ds(k));
        end
        wo1 = wo1 + eta*do(1)*xo;
        wo2 = wo2 + eta*do(2)*xo;
        wo3 = wo3 + eta*do(3)*xo;
        ws = ws + eta*ds(k)*xs;
    end
end
        
w = [wo1 wo2 wo3];        