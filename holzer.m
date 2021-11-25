clc
clear all
menu('Type of System', '2 Supports', '1 Support', 'No Support');

% Number of Supports=2
if ans==1
   n=input('Enter the number of masses:');
   disp('Enter the values of the m: ');
   i=1;
   while(i<n+1)
        m(i)=input(['m', num2str(i),': ']);
        i=i+1;
   end

   disp('Enter the values of the stiffnesses: ');
   i=1;
   limit=n+2;
   while(i<limit)
        k(i)=input(['k', num2str(i),': ']);
        i=i+1;
   end
    
   h=input('Enter the increment for w: ');
 
   counter=0;
   w(1)=0;
   a=1;
   Number_of_wn=n;

   while(counter~=Number_of_wn)
        i=1;   
        while(i<n+1)
        
             if(i==1)
               x(i)=1;
             else
                 x(i)=x(i-1)-del(i-1);
             end
        
             I(i)=m(i)*w(a)*w(a)*x(i);
   
             if(i==1)
               SumI(i)= I(i) - k(i)*x(i);
             else
                 SumI(i)= I(i)+ SumI(i-1);
             end
    
             del(i)=SumI(i)/k(i+1);
     
             i=i+1;
        end
        x(n+1)=x(n)-del(n);
        value(a+1)=x(n+1);
        if(value(a+1)*value(a)<0)
          disp (['w_n(', num2str(counter+1),'): ',num2str(w(a))]);
          counter=counter+1;
        end
        w(a+1)=w(a)+h;
        a=a+1;
   end
   

% Number of Supports=1   
else
    if ans==2
       n=input('Enter the number of masses:');
       disp('Enter the values of the m: ');
       i=1;
       while(i<n+1)
            m(i)=input(['m', num2str(i),': ']);
            i=i+1;
       end
       i=1;

       disp('Enter the values of the stiffnesses: ')
 
       i=1;
       limit=n+1;
       k(1)=0;
       while(i<limit)
            k(i+1)=input(['k', num2str(i),': ']);
            i=i+1;
       end
    
       h=input('Enter the increment for w: ');
 
       counter=0;
       w(1)=0;
       a=1;
       Number_of_wn=n;

       while(counter~=Number_of_wn)
            i=1;   
            while(i<n+1)
        
                 if(i==1)
                   x(i)=1;
                 else
                     x(i)=x(i-1)-del(i-1);
                 end
    
            I(i)=m(i)*w(a)*w(a)*x(i);
   
            if(i==1)
              SumI(i)= I(i) - k(i)*x(i);
            else
                SumI(i)= I(i)+ SumI(i-1);
            end
    
            del(i)=SumI(i)/k(i+1);
     
            i=i+1;
            end
            x(n+1)=x(n)-del(n);
            value(a+1)=x(n+1);
            if(value(a+1)*value(a)<0)
              disp (['w_n(', num2str(counter+1),'): ',num2str(w(a))]);
              counter=counter+1;
            end
            w(a+1)=w(a)+h;
            a=a+1;
       end

% Number of Supports=0       
    else
        n=input('Enter the number of masses=');
        disp('Enter the values of  masses= ');
        i=1;
        while(i<n+1)
             m(i)=input(['m', num2str(i),': ']);
             i=i+1;
        end
        i=1;

        disp('Enter the values of the stiffnesses= ');
 
        i=1;
        limit=n;
        k(1)=0;
        k(n+1)=1;
        while(i<limit)
             k(i+1)=input(['k', num2str(i),': ']);
             i=i+1;
        end
    
        h=input('Enter the increment for w= ');
        disp (['w_n(1)= ','0']);
        counter=0;
        w(1)=0;
        a=1;
        Number_of_wn=n-1;

        while(counter~=Number_of_wn)
             i=1;   
             while(i<n+1)
        
                  if(i==1)
                    x(i)=1;
                  else
                      x(i)=x(i-1)-del(i-1);
                  end
    
                  I(i)=m(i)*w(a)*w(a)*x(i);
   
                  if(i==1)
                    SumI(i)= I(i) - k(i)*x(i);
                  else
                      SumI(i)= I(i)+ SumI(i-1);
                  end
    
                  del(i)=SumI(i)/k(i+1);
     
                  i=i+1;
             end
    
             value(a+1)=SumI(n);
             if(value(a+1)*value(a)<0)
               disp (['w_n(', num2str(counter+2),')= ',num2str(w(a))]);
               counter=counter+1;
             end
             w(a+1)=w(a)+h;
             a=a+1;
        end
    end
end
plot(w,value)