%--------------------------------------------------------------------------------------------------------     
% Pdf te verilen locationlar ve aralarindaki mesafeler! 
%--------------------------------------------------------------------------------------------------------       
flight(istanbul, izmir, 3). 
flight(istanbul, trabzon, 3). 
flight(istanbul, ankara, 5). 
flight(izmir, antalya, 1). 
flight(izmir, ankara, 6). 
flight(trabzon, ankara, 2). 
flight(ankara, konya, 8). 
flight(antalya, diyarbakir, 5).
flight(konya, diyarbakir, 1).
flight(konya, kars, 5).
flight(kars, gaziantep, 3).
flight(edirne, edremit, 5).
flight(edremit, erzincan, 7).  
%--------------------------------------------------------------------------------------------------------

% Tek adimda ulasilan sehirler icin 
cities_distance(X, Y, C) :-    
        flight(X, Y, C). 

%--------------------------------------------------------------------------------------------------------       
        
% Sehirde karsilikli gidis gelis icin
cities_distance(X, Y, C) :- 
        flight(Y, X, C). 
        
%--------------------------------------------------------------------------------------------------------       

% 2 adimda ulasilan sehirler icin         
% (a,b) - (b,c) -> (a, c)
route(X, Y, C) :-              
        cities_distance(X, Joint, C1), 
        cities_distance(Joint, Y, C2),
        C is C1 + C2. 
        
%--------------------------------------------------------------------------------------------------------       

% 3 adim ve fazlasinda ulasilan sehirler icin 
% (a,b) - (b,c) - (c,d) -> (a, d)        
route(X, Z, C) :-              
        cities_distance(X, Joint1, C1), 
        cities_distance(Joint1, Joint2, C2),
        cities_distance(Joint2, Z, C3),
        C is C1 + C2 + C3. 

%--------------------------------------------------------------------------------------------------------   

% 4 adim ve fazlasinda ulasilan sehirler icin 
% (a,b) - (b,c) - (c,d) -> (a, d)        
route(X, Z, C) :-              
        cities_distance(X, Joint1, C1), 
        cities_distance(Joint1, Joint2, C2),
        cities_distance(Joint2, Joint3, C3),
        cities_distance(Joint3, Z, C3),
        C is C1 + C2 + C3 + C4. 

%--------------------------------------------------------------------------------------------------------       

% 5 adim ve fazlasinda ulasilan sehirler icin 
% (a,b) - (b,c) - (c,d) -> (a, d)        
route(X, Z, C) :-              
        cities_distance(X, Joint1, C1), 
        cities_distance(Joint1, Joint2, C2),
        cities_distance(Joint2, Joint3, C3),
        cities_distance(Joint3, Joint4, C4),
        cities_distance(Joint4, Z, C5),
        C is C1 + C2 + C3 + C4 + C5. 

%--------------------------------------------------------------------------------------------------------

% 5 adim ve fazlasinda ulasilan sehirler icin 
% (a,b) - (b,c) - (c,d) -> (a, d)        
route(X, Z, C) :-              
        cities_distance(X, Joint1, C1), 
        cities_distance(Joint1, Joint2, C2),
        cities_distance(Joint2, Joint3, C3),
        cities_distance(Joint3, Joint4, C4),
        cities_distance(Joint4, Joint5, C5),
        cities_distance(Joint5, Z, C6),
        C is C1 + C2 + C3 + C4 + C5 + C6. 

%--------------------------------------------------------------------------------------------------------
%							PART 2
%-------------------------------------------------------------------------------------------------------- 
croute(X, Y, C) :-
	route(X, Y, C1),
	route(X, Y, C2),
	(C1 < C2 -> C is C1).
	
	 





