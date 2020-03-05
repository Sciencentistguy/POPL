/**/

 sum(List, Sum) :-
     sum1(List, 0, Sum).

 sum1(List, RunningTotal, Sum) :-
     member(Element, List),
     delete(List, Element, NewList),
     NewRunningTotal is RunningTotal + Element,
     length(NewList, Len),
     ((Len is 0, Sum is NewRunningTotal); (Len>0, sum1(NewList, NewRunningTotal, Sum))).

 desc(List) :-
     List=[_];
     List=[Head|NewList],
     NewList=[NewHead|_],
     Head>NewHead,
     desc(NewList).
