///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_termo_tb: dialog {label = "Термометы \"Теплоконтроль\"";

:row {label="";

  :column {
    :text {label="Условное";}
    :text {label="обозначение";}
    :list_box {key="txt-01"; list=""; width=12; height=16;}//list_box
  }//column  

  :column {
    :text {label="Положение";}
    :text {label="термобаллона";}
    :list_box {key="txt-02"; list=""; width=14; height=16;}//list_box
  }//column

  :column {
    :text {label="Пределы";}
    :text {label="изм., °С";}
    :list_box {key="txt-03"; list=""; width=14; height=16;}//list_box
  }//column
  
  :column {
    :text {label="Класс";}
    :text {label="точности";}
    :list_box {key="txt-04"; list=""; width=4; height=16;}//list_box
  }//column
  
  :column {
    :text {label="Диаметр";}
    :text {label="корпуса, мм";}
    :list_box {key="txt-05"; list=""; width=12; height=16;}//list_box
  }//column

  :column {
    :text {label="Lпогр.,";}
    :text {label="мм";}
    :list_box {key="txt-06"; list=""; width=8; height=16;}//list_box
  }//column

  :column {
    :text {label="!!! Диаметр";}
    :text {label="термобаллона, мм";}
    :list_box {key="txt-07"; list=""; width=12; height=16;}//list_box
  }//column 
  
  :column {
    :text {label="Присоединение";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=18; height=16;}//list_box
  }//column
}//row

:toggle {label="Гильза защитная"; key="tgl-01";}

:row {
  :column {    
    :text {label="Модель"; key="ptxt-21";}
    :text {label=""; key="ptxt-22";}
    :list_box {key="txt-21"; list=""; width=10; height=6; is_enabled=falshe;}//list_box
  }//column
 
  :column {    
    :text {label="!!! Диаметр"; key="ptxt-23";}
    :text {label="термобаллона, мм"; key="ptxt-24";}
    :list_box {key="txt-22"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column 
 
  :column {
    :text {label="Pу,"; key="ptxt-25";}
    :text {label="МПа"; key="ptxt-26";}
    :list_box {key="txt-23"; list=""; width=6; height=6; is_enabled=falshe;}//list_box
  }//column 
 
  :column {
    :text {label="Резьба"; key="ptxt-27";}
    :text {label="к бобышке"; key="ptxt-28";}
    :list_box {key="txt-24"; list=""; width=14; height=6; is_enabled=falshe;}//list_box
  }//column 
  
  :column {
    :text {label="Резьба"; key="ptxt-29";}
    :text {label="к термометру"; key="ptxt-210";}
    :list_box {key="txt-25"; list=""; width=14; height=6; is_enabled=falshe;}//list_box
  }//column   

  :column {
    :text {label="Lпогр.,"; key="ptxt-211";}
    :text {label="мм"; key="ptxt-212";}
    :list_box {key="txt-26"; list=""; width=8; height=6; is_enabled=falshe;}//list_box
  }//column

  :column {
    :text {label="Наружний диам."; key="ptxt-213";}
    :text {label="гильзы, мм"; key="ptxt-214";}
    :list_box {key="txt-27"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column
}//row


:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
}//row





:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row


}//row

///////////////////////////////////////////////////////////////////////////////////////////////////////////
