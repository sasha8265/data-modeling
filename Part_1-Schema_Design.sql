-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/nRVI9Z
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Medical Center

CREATE TABLE "Doctors" (
    "id" SERIAL   NOT NULL,
    "name" string   NOT NULL,
    "specialty" string   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" SERIAL   NOT NULL,
    "name" string   NOT NULL,
    "dateofbirth" date   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnosis" (
    "id" SERIAL   NOT NULL,
    "disease_id" int   NOT NULL,
    "visit_id" int   NOT NULL,
    CONSTRAINT "pk_Diagnosis" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visits" (
    "id" SERIAL   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "date" DATE   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

-- Soccer League
CREATE TABLE "Teams" (
    "id" SERIAL   NOT NULL,
    "teamname" text   NOT NULL,
    "city" text   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Seasons" (
    "id" SERIAL   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Matches" (
    "id" SERIAL   NOT NULL,
    "season_id" int   NOT NULL,
    "date" date   NOT NULL,
    "team1" int   NOT NULL,
    "team2" int   NOT NULL,
    "referee_id" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Match_results" (
    "id" SERIAL   NOT NULL,
    "team_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "result" text   NOT NULL,
    CONSTRAINT "pk_Match_results" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Lineups" (
    "id" SERIAL   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Lineups" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" SERIAL   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

-- Craigslist
CREATE TABLE "Regions" (
    "id" SERIAL   NOT NULL,
    "region" text   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" SERIAL   NOT NULL,
    "username" text   NOT NULL,
    "preferred_region_id" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Categories" (
    "id" SERIAL   NOT NULL,
    "category" text   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" SERIAL   NOT NULL,
    "category_id" int   NOT NULL,
    "post_date" DATE   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "region_id" int   NOT NULL,
    "location" text   NOT NULL,
    "user_id" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visits" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_season_id" FOREIGN KEY("season_id")
REFERENCES "Seasons" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_team1" FOREIGN KEY("team1")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_team2" FOREIGN KEY("team2")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_referee_id" FOREIGN KEY("referee_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Match_results" ADD CONSTRAINT "fk_Match_results_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Match_results" ADD CONSTRAINT "fk_Match_results_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("id");

