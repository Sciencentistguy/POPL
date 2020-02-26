/**/

/* --------------------
   Question 1
   ------------------*/

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
