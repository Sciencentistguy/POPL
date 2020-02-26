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
station_exists(Station) :- station(Station, _).
/*-------------------*/
/*     Testcases     */
% True:
% station_exists(wa).
% station_exists(vi).
% station_exists(ws).
% station_exists(al).

%False:
% station_exists(a).
% station_exists(thisstationdoesnotexist).
% station_exists(helloworld).
% station_exists(wat).
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
