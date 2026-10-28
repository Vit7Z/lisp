///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_temp_sensor_owen: dialog {label = "Датчики температуры \"Овен\"";

:row {label="";
  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=12; height=10; }//list_box
  }//column  

  :column {
    :text {label="Пределы";}
    :text {label="изм.";}
    :list_box {key="txt-02"; list=""; width=15; height=10; }//list_box
  }//column

  :column {
    :text {label="Кл.";}
    :text {label="точности";}
    :list_box {key="txt-03"; list=""; width=7; height=10; }//list_box
  }//column

  :column {
    :text {label="Длина,";}
    :text {label="мм";}
    :list_box {key="txt-04"; list=""; width=10; height=10; }//list_box
  }//column  

  :column {
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=10;}//list_box
  }//column

  :column {
    :text {label="Конструкция";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=30; height=10;}//list_box
  }//column

  :column {
    :text {label="Тип";}
    :text {label="штуцера";}
    :list_box {key="txt-06"; list=""; width=10; height=10;}//list_box
  }//column

  :column {
    :text {label="Диам. термо-";}
    :text {label="баллона, мм";}
    :list_box {key="txt-07"; list=""; width=3; height=10;}//list_box
  }//column

}//row


:row {
	:list_box {key="txt-900"; list="* - стандартные опции. С коммутационной головкой."; width=10; height=3; is_enabled=falshe;}
}//row


:toggle {label="Гильза защитная"; key="tgl-01";}


:row {
  :column {    
    :text {label="Ру, МПа";}
    :text {label="";}
    :list_box {key="txt-21"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column
 
  :column {    
    :text {label="К";}
    :text {label="бобышке";}
    :list_box {key="txt-22"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column 
 
  :column {
    :text {label="К";}
    :text {label="прибору";}
    :list_box {key="txt-23"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column 
  
  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-24"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column   

  :column {
    :text {label="Длина,";}
    :text {label="мм";}
    :list_box {key="txt-25"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column

  :column {
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-26"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column

  :column {
    :text {label="Внутр. ";}
    :text {label="диаметр, мм";}
    :list_box {key="txt-27"; list=""; width=3; height=6; is_enabled=falshe;}//list_box
  }//column  
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row

:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-91"; list=""; width=18; height=8; value= "0";}
	}//column
}//row


}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
