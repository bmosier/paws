-- These could all have their own files in the repository
-- organized into appropriate folders.

CREATE DEFINER=`mosierb`@`%` FUNCTION `get_age_descriptor`(_animal_ID int) RETURNS varchar(50) CHARSET latin1
BEGIN

DECLARE _age int;
DECLARE _species varchar (50);

-- get age in weeks and upper(species) for the following conditional block
select DATEDIFF(CURRENT_DATE(), animal_DOB) / 7, upper(animal_species)
	into _age, _species from animal
	where animal_ID = _animal_ID;

if (_species = "CAT" and _age < 10) then return "BABY";
	elseif (_species = "CAT" and _age < 52 ) then return "KITTEN";
	elseif (_species = "CAT" and _age < 104) then return "YOUNG";
	elseif (_species = "CAT" and _age < 520) then return "ADULT";
	elseif (_species = "DOG" and _age < 8 ) then return "BABY";
	elseif (_species = "DOG" and _age < 52 ) then return "PUPPY";
	elseif (_species = "DOG" and _age < 104) then return "YOUNG";
	elseif (_species = "DOG" and _age < 520) then return "ADULT";
    else return "SENIOR";
END IF;
    
END

CREATE DEFINER=`mosierb`@`%` TRIGGER `f20_paws`.`fosterhome_animal_AFTER_UPDATE` AFTER UPDATE ON `fosterhome_animal` FOR EACH ROW
BEGIN

update animal
set is_fostered = TRUE
where animal.animal_ID = NEW.animal_ID;

END


CREATE DEFINER=`mosierb`@`%` PROCEDURE `to_shelter`(_animal_ID int, _shelter_ID int)
BEGIN
-- To move an animal from a fosterhome to a shelter
-- or
-- Move an animal to a new shelter

update animal
set shelter_ID = _shelter_ID, is_currently_fostered = FALSE
where animal_ID = _animal_ID;


END
