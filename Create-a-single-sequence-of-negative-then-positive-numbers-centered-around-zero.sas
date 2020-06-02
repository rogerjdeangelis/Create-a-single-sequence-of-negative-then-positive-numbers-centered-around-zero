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
                                                                                                                                    
