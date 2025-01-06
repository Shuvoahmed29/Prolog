% Facts
current_temperature(30).        % Example current temperature (can be updated dynamically)
desired_temperature(22).        % Example desired temperature (can be updated dynamically)
time_of_day(afternoon).         % Example time of day (morning/afternoon/evening/night)
home_occupied(yes).             % Example occupancy status (yes/no)

% Rules to adjust temperature based on occupancy and time of day
adjust_temperature :-
    home_occupied(yes),
    desired_temperature(DesiredTemp),
    current_temperature(CurrentTemp),
    CurrentTemp \= DesiredTemp,
    (CurrentTemp < DesiredTemp ->
        activate_heating;
        activate_cooling).

adjust_temperature :-
    home_occupied(no),
    time_of_day(night),
    current_temperature(CurrentTemp),
    (CurrentTemp > 22 -> reduce_heating;
        CurrentTemp < 18 -> reduce_cooling).

adjust_temperature :-
    home_occupied(yes),
    current_temperature(CurrentTemp),
    desired_temperature(DesiredTemp),
    (CurrentTemp < 18 ; CurrentTemp > 24),
    (CurrentTemp < DesiredTemp -> activate_heating ; activate_cooling).

% Actions
activate_heating :-
    current_temperature(CurrentTemp),
    desired_temperature(DesiredTemp),
    (CurrentTemp < DesiredTemp ->
        write('Activating heating...');
        write('Heating not needed.')).

activate_cooling :-
    current_temperature(CurrentTemp),
    desired_temperature(DesiredTemp),
    (CurrentTemp > DesiredTemp ->
        write('Activating cooling...');
        write('Cooling not needed.')).

reduce_heating :-
    write('Reducing heating to save energy during night time...').

reduce_cooling :-
    write('Reducing cooling to save energy during night time...').
