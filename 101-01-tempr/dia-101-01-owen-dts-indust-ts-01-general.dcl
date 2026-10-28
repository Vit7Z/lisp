///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_tempr_owen: dialog {label = "ОВЕН ДТС, общепром.";

:row {label="";
  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=7; }//list_box
  }//column  

  :column {
    :text {label="Кол. ";}
    :text {label="ЧЭ";}
    :list_box {key="txt-02"; list=""; width=2; height=7; }//list_box
  }//column

  :column {
    :text {label="Конструкт.";}
    :text {label="исп. головки";}
    :list_box {key="txt-03"; list=""; width=14; height=7; }//list_box
  }//column

  :column {
    :text {label="НСХ";}
    :text {label="(пределы изм.)";}
    :list_box {key="txt-04"; list=""; width=17; height=7; }//list_box
  }//column

  :column {
    :text {label="Класс";}
    :text {label="допуска";}
    :list_box {key="txt-05"; list=""; width=8; height=7; }//list_box
  }//column

  :column {
    :text {label="Схема";}
    :text {label="соединен.";}
    :list_box {key="txt-06"; list=""; width=13; height=7; }//list_box
  }//column

  :column {
    :text {label="Длина,";}
    :text {label="мм";}
    :list_box {key="txt-07"; list=""; width=10; height=7; }//list_box
  }//column  

  :column {
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=7;}//list_box
  }//column
}//row

:row {label="";
  :column {
    :text {label="Материал";}
    :text {label="головки";}
    :list_box {key="txt-08"; list=""; width=15; height=6;}//list_box
  }//column 

  :column {
    :text {label="Конструкция";}
    :text {label="";}
    :list_box {key="txt-09"; list=""; width=30; height=6;}//list_box
  }//column

  :column {
    :text {label="Диаметр термо-";}
    :text {label="баллона, мм";}
    :list_box {key="txt-10"; list=""; width=3; height=6;}//list_box
  }//column
  
  :column {
    :text {label="Материал защитной";}
    :text {label="арматуры";}
    :list_box {key="txt-11"; list=""; width=3; height=6;}//list_box
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
    :list_box {key="txt-21"; list=""; width=3; height=8; is_enabled=falshe;}//list_box
  }//column
 
  :column {    
    :text {label="К";}
    :text {label="бобышке";}
    :list_box {key="txt-22"; list=""; width=3; height=8; is_enabled=falshe;}//list_box
  }//column 
 
  :column {
    :text {label="К";}
    :text {label="прибору";}
    :list_box {key="txt-23"; list=""; width=3; height=8; is_enabled=falshe;}//list_box
  }//column 
  
  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-24"; list=""; width=3; height=8; is_enabled=falshe;}//list_box
  }//column   

  :column {
    :text {label="Длина,";}
    :text {label="мм";}
    :list_box {key="txt-25"; list=""; width=3; height=8; is_enabled=falshe;}//list_box
  }//column

  :column {
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-26"; list=""; width=3; height=8; is_enabled=falshe;}//list_box
  }//column

  :column {
    :text {label="Внутр. ";}
    :text {label="диаметр, мм";}
    :list_box {key="txt-27"; list=""; width=3; height=8; is_enabled=falshe;}//list_box
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
