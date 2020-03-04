/**/

/*-------------------*/
/*    Question 1     */
/*-------------------*/
station(al, [metropolitan]).
station(bg, [central]).
station(br, [victoria]).
station(bs, [metropolitan]).
station(cl, [central]).
station(ec, [bakerloo]).
station(em, [bakerloo, northern]).
station(eu, [northern]).
station(fp, [victoria]).
station(fr, [metropolitan]).
station(ke, [northern]).
station(kx, [victoria, metropolitan]).
station(lg, [central]).
station(ls, [central, metropolitan]).
station(nh, [central]).
station(oc, [bakerloo, central, victoria]).
station(pa, [bakerloo]).
station(tc, [central,northern]).
station(vi, [victoria]).
station(wa, [bakerloo]).
station(ws, [victoria, northern]).

/*-------------------*/
/*    Question 2     */
/*-------------------*/
% Returns true if the station exists, false otherwise.
 station_exists(Station) :-
     station(Station, _).
/*-------------------*/
/*     Testcases     */
% True:
%station_exists(wa).
%station_exists(vi).
%station_exists(ws).
%station_exists(al).

%False:
%station_exists(a).
%station_exists(thisstationdoesnotexist).
%station_exists(helloworld).
%station_exists(wat).
/*-------------------*/

/*-------------------*/
/*    Question 3     */
/*-------------------*/

fact_adjacent(bs, kx).
fact_adjacent(cl, ls).
fact_adjacent(em, ec).
fact_adjacent(em, ke).
fact_adjacent(eu, ws).
fact_adjacent(fp, kx).
fact_adjacent(fr, bs).
fact_adjacent(kx, ls).
fact_adjacent(kx, ws).
fact_adjacent(lg, oc).
fact_adjacent(ls, al).
fact_adjacent(ls, bg).
fact_adjacent(nh, lg).
fact_adjacent(oc, em).
fact_adjacent(oc, tc).
fact_adjacent(oc, vi).
fact_adjacent(pa, oc).
fact_adjacent(tc, cl).
fact_adjacent(tc, em).
fact_adjacent(vi, br).
fact_adjacent(wa, pa).
fact_adjacent(ws, tc).

adjacent(X,Y) :- fact_adjacent(X, Y); fact_adjacent(Y, X).

/*-------------------*/
/*    Question 4     */
/*-------------------*/
% This function gets the lists of lines that station1 and station2 are on
% It returns the element that is in both lists.
% If there is no element, it will return false.
 sameline(Station1, Station2, Line) :- 
     station(Station1, Line1),
     station(Station2, Line2),
     member(Line, Line1),
     member(Line, Line2).

/*-------------------*/
/*     Testcases     */
% Bakerloo:
%sameline(wa, pa, List).
%sameline(oc, em, List).

% Central:
%sameline(nh, lg, List).
%sameline(tc, cl, List).

% False:
%sameline(nh, wa, List).
%sameline(nh, ws, List).
/*-------------------*/ 

/*-------------------*/
/*    Question 5     */
/*-------------------*/

% This function finds all stations where "Line" is a member of the list of lines returned by "station()"
 line(Line, ListOfStations) :-
     findall(Station, (station(Station, StatLine), member(Line, StatLine)), ListOfStations).

/*-------------------*/
/*     Testcases     */
% ListOfStations = [em, eu, ke, tc, ws].
%line(northern, ListOfStations).
 
% ListOfStations = [al, bs, fr, kx, ls].
%line(metropolitan, ListOfStations).

% ListOfStations = []
%line(notALine, ListOfStations).
/*-------------------*/

/*-------------------*/
/*    Question 6     */
/*-------------------*/ 

 % This function gets the list of lines that go through a given station and returns the length of that list.
 station_numlines(Station, NumberOfLines) :-
     station(Station, Lines),
     length(Lines, NumberOfLines).
/*-------------------*/
/*     Testcases     */
% NumberOfLines = 1
%station_numlines(al, NumberOfLines).
%station_numlines(pa, NumberOfLines).
%station_numlines(nh, NumberOfLines).

% NumberOfLines = 2
%station_numlines(ws, NumberOfLines).
%station_numlines(kx, NumberOfLines).

% NumberOfLines = 3
%station_numlines(ws, NumberOfLines).

% NumberOfLines = 0
%station_numlines(notAStation, NumberOfLines).
/*-------------------*/ 

/*-------------------*/
/*    Question 7     */
/*-------------------*/ 
% This function first gets the list of lines that the non interchange station is on, and checks that it is only one line.
% It then gets the list of lines of the interchange station and ensures that it is on more than one (this makes it an interchange).
% It then checks that the two stations are adjacent.
 adjacent2interchange(NonInterchangeStation, InterchangeStation) :-
     station(NonInterchangeStation, NonInterLines),
     length(NonInterLines, NonInterLinesLength),
     NonInterLinesLength == 1,
     station(InterchangeStation, InterLines),
     length(InterLines, InterLinesLength),
     InterLinesLength > 1,
     adjacent(NonInterchangeStation, InterchangeStation).
/*-------------------*/
/*     Testcases     */
 % False.
%adjacent2interchange(oc, InterchangeStation).
%adjacent2interchange(thisstationdoesnotexist, InterchangeStation).

% InterchangeStation = tc; InterchangeStation = ls.
%adjacent2interchange(cl, InterchangeStation).
/*-------------------*/ 

/*-------------------*/
/*    Question 8     */
/*-------------------*/  
% This function calculates the route from From to To.
 route(From, To, Route) :-
     calculate_route(From, To, [], Route_out),
     reverse([To | Route_out], Route).

% Base case
 calculate_route(From, To, StoreRoute, Route) :-
     \+member(From, StoreRoute),
     adjacent(From, To),
     Route = [From| StoreRoute].

% Recursive case
 calculate_route(From, To, StoreRoute, Route) :-
     Next \== To,
     adjacent(From, Next),
     \+member(From, StoreRoute),
     calculate_route(Next, To, [From | StoreRoute], Route).

/*-------------------*/
/*     Testcases     */
% False
%route(tc, thisstationdoesnotexist, Route).

% Route = [tc, ws, kx, ls, cl].
%route(tc, cl, Route).
/*-------------------*/ 

/*-------------------*/
/*    Question 9     */
/*-------------------*/ 

  % This function calculates how long it takes to get from one station to another. First it calculates a route between the two stations.
  % It then gets the length of that route, subtracts one, and multiplies by 4, to return the answer.
  % It does this for all routes
  route_times(From, To, Route, Minutes) :-
      route(From, To, Route),
      length(Route, TimeTaken),
      Minutes is (TimeTaken - 1) * 4. 
 /*-------------------*/
 /*     Testcases     */
% False.
%route_times(ec, thisstationdoesnotexist, Route, Minutes).

% Route = [fr, bs, kx, ls, cl, tc, oc],
% Minutes = 24 ;
% Route = [fr, bs, kx, ls, cl, tc, em, oc],
% Minutes = 28 ;
%route_times(fr, oc, Route, Minutes).
 /*-------------------*/
