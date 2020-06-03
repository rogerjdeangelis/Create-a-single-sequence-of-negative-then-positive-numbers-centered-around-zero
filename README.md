# Create-a-single-sequence-of-negative-then-positive-numbers-centered-around-zero
Create a single sequence of negative then positive numbers centered around zero
    Create a single sequence of negative then positive numbers centered around zero                                               
                                                                                                                                  
    github                                                                                                                        
    https://tinyurl.com/ycct4ach                                                                                                  
    https://github.com/rogerjdeangelis/Create-a-single-sequence-of-negative-then-positive-numbers-centered-around-zero            
                                                                                                                                  
    stackoverflow                                                                                                                 
    https://tinyurl.com/ybmbqswu                                                                                                  
    https://stackoverflow.com/questions/62057579/r-how-to-create-an-ascending-descending-number-line-around-a-specific-element    
                                                                                                                                  
    Yuriy Saraykin                                                                                                                
    https://stackoverflow.com/users/12025483/yuriy-saraykin                                                                       
                                                                                                                                  
        Two Solutions                                                                                                             
            a. sas                                                                                                                
            b. R                                                                                                                  
            c. dosubl                                                                                                             
    *_                   _                                                                                                        
    (_)_ __  _ __  _   _| |_                                                                                                      
    | | '_ \| '_ \| | | | __|                                                                                                     
    | | | | | |_) | |_| | |_                                                                                                      
    |_|_| |_| .__/ \__,_|\__|                                                                                                     
            |_|                                                                                                                   
    ;                                                                                                                             
                                                                                                                                  
    %let vec=. . . . . 0 . . . . . . . . . . .;                                                                                   
    %let dim=%eval(%sysfunc(countc(&vec,%str(.))) + 1);                                                                           
                                                                                                                                  
    SAS                                                                                                                           
    %put &=vec;                                                                                                                   
                                                                                                                                  
     VEC=. . . . . 0 . . . . . . . . . . .                                                                                        
                                                                                                                                  
    R                                                                                                                             
                                                                                                                                  
    %let VEC=%str(NA, NA, NA, NA, NA, 0 ,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA);                                             
                                                                                                                                  
    %put &=vec;                                                                                                                   
                                                                                                                                  
      VEC=NA, NA, NA, NA, NA, 0 ,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA                                                       
                                                                                                                                  
    *            _               _                                                                                                
      ___  _   _| |_ _ __  _   _| |_                                                                                              
     / _ \| | | | __| '_ \| | | | __|                                                                                             
    | (_) | |_| | |_| |_) | |_| | |_                                                                                              
     \___/ \__,_|\__| .__/ \__,_|\__|                                                                                             
                    |_|                                                                                                           
    ;                                                                                                                             
                                                                                                                                  
    *SAS;                                                                                                                         
                                                                                                                                  
    %put &=fromsas;                                                                                                               
                                                                                                                                  
    FROMSAS=-5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11                                                                              
                                                                                                                                  
                                                                                                                                  
    * R;                                                                                                                          
    %put &=fromr;                                                                                                                 
                                                                                                                                  
    FROMR=-5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11                                                                                
                                                                                                                                  
    *          _       _   _                                                                                                      
     ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                      
    / __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                                     
    \__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                     
    |___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                     
     ___  __ _ ___                                                                                                                
    / __|/ _` / __|                                                                                                               
    \__ \ (_| \__ \                                                                                                               
    |___/\__,_|___/                                                                                                               
                                                                                                                                  
    ;                                                                                                                             
                                                                                                                                  
    %symdel fromsas dim / nowarn;                                                                                                 
                                                                                                                                  
    %let vec=. . . . . 0 . . . . . . . . . . .;                                                                                   
    %let dim=%eval(%sysfunc(countc(&vec,%str(.))) + 1);                                                                           
                                                                                                                                  
    data want;                                                                                                                    
                                                                                                                                  
       array nums[&dim] v1-v&dim (&vec);                                                                                          
       pos_zero=whichn(0,of nums[*]);                                                                                             
                                                                                                                                  
       do i=1 to &dim;                                                                                                            
          nums[i]= i - pos_zero;                                                                                                  
       end;                                                                                                                       
                                                                                                                                  
       call symputx('fromsas',catx(" ",of nums[*]));                                                                              
                                                                                                                                  
    run;quit;                                                                                                                     
                                                                                                                                  
    %put &=fromsas;                                                                                                               
                                                                                                                                  
    *____                                                                                                                         
    |  _ \                                                                                                                        
    | |_) |                                                                                                                       
    |  _ <                                                                                                                        
    |_| \_\                                                                                                                       
                                                                                                                                  
    ;                                                                                                                             
                                                                                                                                  
    %symdel fromr / nowarn;                                                                                                       
                                                                                                                                  
    %let VEC=%str(NA, NA, NA, NA, NA, 0 ,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA);                                             
                                                                                                                                  
    %utl_submit_r64("                                                                                                             
    v <- c(&vec);                                                                                                                 
    want=seq_along(v) - which(v == 0);                                                                                            
    writeClipboard(as.character(paste(want, collapse = ' ')));                                                                    
    ",returnvar=fromr);                                                                                                           
                                                                                                                                  
    %put &=fromr;                                                                                                                 
                                                                                                                                  
    *    _                 _     _                                                                                                
      __| | ___  ___ _   _| |__ | |                                                                                               
     / _` |/ _ \/ __| | | | '_ \| |                                                                                               
    | (_| | (_) \__ \ |_| | |_) | |                                                                                               
     \__,_|\___/|___/\__,_|_.__/|_|                                                                                               
                                                                                                                                  
    ;                                                                                                                             
                                                                                                                                  
    Thanks Paul.                                                                                                                  
                                                                                                                                  
    You inspired me to present this solution.                                                                                     
    A little less Klingon?                                                                                                        
                                                                                                                                  
    * you need this macro;                                                                                                        
                                                                                                                                  
    %macro dosubl(arg);                                                                                                           
      %let rc=%qsysfunc(dosubl(&arg));                                                                                            
    %mend dosubl;                                                                                                                 
                                                                                                                                  
                                                                                                                                  
    SAS needs to enhance dosubl, shared storage?                                                                                  
                                                                                                                                  
    * Perhaps a little easier to maintain?                                                                                        
                                                                                                                                  
    %symdel v dim lwr upr / nowarn;                                                                                               
                                                                                                                                  
    %let v = . . . . . 0 . . . . . . . . . . .;                                                                                   
                                                                                                                                  
    data _null_ ;                                                                                                                 
       if _n_=0 then do; %dosubl('                                                                                                
               data _null_;                                                                                                       
                  retain v "&v";                                                                                                  
                  dim =  count(v,".") + 1;                                                                                        
                  upr =  find(v,"0");                                                                                             
                  lwr =  upr - dim +1;                                                                                            
                  call symputx("dim",dim);                                                                                        
                  call symputx("lwr",lwr);                                                                                        
                  call symputx("upr",upr);                                                                                        
                  put (_all_)  ( = /);                                                                                            
               run;quit;                                                                                                          
               ');                                                                                                                
       end;                                                                                                                       
                                                                                                                                  
       array ary[&dim] (&lwr : &upr);                                                                                             
       put ary[*];                                                                                                                
                                                                                                                                  
    run;quit;                                                                                                                     
                                                                                                                                  
    260   %symdel v dim lwr upr / nowarn;                                                                                         
    261   %let v = . . . . . 0 . . . . . . . . . . .;                                                                             
    262   data _null_ ;                                                                                                           
    263      if _n_=0 then do; %dosubl('                                                                                          
    264              data _null_;                                                                                                 
    265                 retain v "&v";                                                                                            
    266                 dim =  count(v,".") + 1;                                                                                  
    267                 upr =  find(v,"0");                                                                                       
    268                 lwr =  upr - dim +1;                                                                                      
    269                 call symputx("dim",dim);                                                                                  
    270                 call symputx("lwr",lwr);                                                                                  
    271                 call symputx("upr",upr);                                                                                  
                                                                                                                                  
    V=. . . . . 0 . . . . . . . . . . .                                                                                           
    DIM=17                                                                                                                        
    UPR=11                                                                                                                        
    LWR=-5                                                                                                                        
    NOTE: DATA statement used (Total process time):                                                                               
          real time           0.07 seconds                                                                                        
          cpu time            0.07 seconds                                                                                        
                                                                                                                                  
                                                                                                                                  
    272                 put (_all_)  ( = /);                                                                                      
    273              run;quit;                                                                                                    
    274              ');                                                                                                          
    275      end;                                                                                                                 
    276      array ary[&dim] (&lwr : &upr);                                                                                       
    277      put ary[*];                                                                                                          
    278   run;                                                                                                                    
                                                                                                                                  
    -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11                                                                                      
    NOTE: DATA statement used (Total process time):                                                                               
          real time           0.21 seconds                                                                                        
          cpu time            0.20 seconds                                                                                        
                                                                                                                                  
                                                                                                                                  
                                                                                                             
                                                                                                                                        
                                                                                                                                        
