clc;
close all;
syms x;

y=input('Enter the function: ','s');
f=inline(y);

xl=input('Enter the lower limit: ');
xu=input('Enter the upper limit: ');

choice=input(['Enter the method:\n' ...
              '1. Number of iterations\n' ...
              '2. Approximate error (Ea)\n' ...
              '3. True error (Et)\n\n' ...
              'Enter choice: ']);


% =========================================================
% CASE 1 : NUMBER OF ITERATIONS
% =========================================================
if choice==1

    n=input('Enter the number of iterations: ');

        fprintf('+------------+--------------+--------------+--------------+\n');
        fprintf('| Iteration  |       Xr      |     f(Xr)    |     Ea(%%)   |\n');
        fprintf('+------------+--------------+--------------+--------------+\n');


    for i=1:n

        xr=(xl+xu)/2;
        fxr=f(xr);


        % Approximate error
        if i==1
            ea=100;
        else
            ea=abs((xr-xo)/xr)*100;
        end

 
            if i==1
                fprintf('|     %2d     |  %10.6f  |  %10.6f  |     100      |\n', ...
                        i,xr,fxr);
            else
                fprintf('|     %2d     |  %10.6f  |  %10.6f  |  %10.6f  |\n', ...
                        i,xr,fxr,ea);
            end

       
       

        % Bisection interval
        if f(xl)*fxr>0
            xl=xr;
        else
            xu=xr;
        end

        xo=xr;

    plot(xr,f(xr),'r*');
    grid on;
    hold on;
    xlabel('Xr');
    ylabel('F(Xr)');
    title('Root Approximation:');


    end

    
        fprintf('+------------+--------------+--------------+--------------+\n');


    plot(xr,f(xr),'go');


% =========================================================
% CASE 2 : APPROXIMATE ERROR (Ea)
% =========================================================
elseif choice==2

    es=input('Enter the specified approximate error (%): \n');

   
        fprintf('+------------+--------------+--------------+--------------+\n');
        fprintf('| Iteration  |       Xr     |     f(Xr)    |     Ea(%%)    |\n');
        fprintf('+------------+--------------+--------------+--------------+\n');

    ea=100;
    xo=0;
    i=1;


    while ea>es

        xr=(xl+xu)/2;
    

        % Approximate error
        if i==1
            ea=100;
        else
            ea=abs((xr-xo)/xr)*100;
        end

     
            if i==1
                fprintf('|     %2d     |  %10.6f  |  %10.6f  |     100      |\n', ...
                        i,xr,f(xr));
            else
                fprintf('|     %2d     |  %10.6f  |  %10.6f  |  %10.6f  |\n', ...
                        i,xr,f(xr),ea);
            end

      

        % Bisection interval
        if f(xl)*f(xr)>0
            xl=xr;
        else
            xu=xr;
        end

        xo=xr;
        i=i+1;
        plot(xr,f(xr),'r*');
        grid on;
        hold on;
        xlabel('Xr');
        ylabel('F(Xr)');
        title('Root Approximation:');
    end

        fprintf('+------------+--------------+--------------+--------------+\n');
        
        plot(xr,f(xr),'go');

  


% =========================================================
% CASE 3 : TRUE ERROR (Et)
% =========================================================
elseif choice==3

    tv=input('Enter the true value of root: ');
    es=input('Enter the specified true error (%): \n');

    xo=0;
    i=1;
    xr=(xl+xu)/2;
    et=abs((tv-xr)/tv)*100;



    fprintf('+-----------+--------------+----------------+----------------+----------------+\n');
    fprintf('| Iteration |      Xr      |      f(Xr)     |      Ea(%%)     |     Et(%%)      |\n');
    fprintf('+-----------+--------------+----------------+----------------+----------------+\n');

    while et>es

        xr=(xl+xu)/2;
        fxr=f(xr);
       
        % Approximate error
        if i==1
            ea=100;
        else
            ea=abs((xr-xo)/xr)*100;
        end

        % True error
        et=abs((tv-xr)/tv)*100;

        if i==1
            fprintf('|     %d     |  %10.6f  |  %10.6f    |     100        |  %10.6f    |\n',i,xr,fxr,et);
        else
            fprintf('|     %d     |  %10.6f  |  %10.6f    |  %10.6f    |  %10.6f    |\n',i,xr,fxr,ea,et);
        end

        % Bisection interval
        if f(xl)*fxr>0
            xl=xr;
        else
            xu=xr;
        end

        xo=xr;
        i=i+1;

        plot(xr,f(xr),'r*');
        grid on;
        hold on;
        xlabel('Xr');
        ylabel('F(Xr)');
        title('Root Approximation:');
    end

     fprintf('+-----------+--------------+----------------+----------------+----------------+\n');
    
     
     plot(xr,f(xr),'go');

else

    fprintf('\nInvalid choice.\n');

end


