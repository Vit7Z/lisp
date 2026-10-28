dia_701_pipes_general: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="НТД";}
    :text {label="";}
    :text {label=""; }//text
    :list_box {key="txt-00"; list=""; width=20; height=15; value=0;}//list_box
  }//column
   
  :column {label="";
    :text {label="Усл. проход х"; key="ptxt-011";}
    :text {label="Толщ. стенки,"; key="ptxt-012";}
    :text {label="мм"; key="ptxt-013";}//text
    :list_box {key="txt-01"; list=""; width=20; height=15; value=0; multiple_select=true;}//list_box
  }//column

  :column {label="";
    :text {label="Наружный"; key="ptxt-021";}
    :text {label="диаметр, мм."; key="ptxt-022";}
    :text {label=""; key="ptxt-023";}//text
    :list_box {key="txt-02"; list=""; width=20; height=15; value=0; multiple_select=true;}//list_box
  }//column

  :column {label="";
    :text {label="Масса"; key="ptxt-031";}
    :text {label="1 м., кг"; key="ptxt-032";}
    :text {label=""; key="ptxt-033";}//text
    :list_box {key="txt-03"; list=""; width=24; height=15; value=0; multiple_select=true;}//list_box
  }//column
 
  :column {label="";
    :text {label="Тип"; key="ptxt-041";}
    :text {label=""; key="ptxt-042";}
    :text {label="";  key="ptxt-043";}//text
    :list_box {key="txt-04"; list=""; width=24; height=15; value=0; multiple_select=true;}//list_box
  }//column  
  
  :column {label="";
    :text {label=""; key="ptxt-051";}
    :text {label=""; key="ptxt-052";}
    :text {label="";  key="ptxt-053";}//text
    :list_box {key="txt-05"; list=""; width=22; height=15; value=0; multiple_select=true;}//list_box
  }//column

	:column {label="";
			:text {label="Выбрано";}
			:text {label="";}
			:text {label="";}
			:list_box {label=""; key="txt-901"; list=""; width=60; height=15; value= "0";}
	}//column

}//row

:row {label="";
	:text {label=""; key="ptxt-061"; value="Труба стальная водогазопроводная. Только для взрывоопасных установок";}
}//row



:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="ПЭ ЧРО"; key="but3"; height=1;}
	:button {label="СПЦФ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
