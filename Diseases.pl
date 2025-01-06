% Facts: Diseases and their associated symptoms
disease(cold).
disease(flu).
disease(covid_19).

symptom(cough).
symptom(sore_throat).
symptom(fever).
symptom(fatigue).
symptom(shortness_of_breath).
symptom(body_aches).

% Symptoms associated with each disease
disease_symptoms(cold, [cough, sore_throat, no_fever]).
disease_symptoms(flu, [fever, cough, body_aches, fatigue]).
disease_symptoms(covid_19, [fever, cough, fatigue, shortness_of_breath]).

% Rule: has_disease/1 identifies potential diseases based on symptoms
has_disease(Disease) :-
    disease(Disease),
    disease_symptoms(Disease, Symptoms),
    symptom_list_matches(Symptoms).

% Rule: symptom_list_matches/1 matches the symptoms entered by the user with the disease's symptoms
symptom_list_matches([no_fever | Rest]) :-
    \+ symptom(fever),
    symptom_list_matches(Rest).
symptom_list_matches([Symptom | Rest]) :-
    symptom(Symptom),
    symptom_list_matches(Rest).
symptom_list_matches([]).

% Sample Queries:

% To diagnose the disease based on symptoms entered by the user
% ?- symptom(fever), symptom(cough), symptom(fatigue), has_disease(Disease).

% Check possible disease for common symptoms
% ?- has_disease(Disease).
