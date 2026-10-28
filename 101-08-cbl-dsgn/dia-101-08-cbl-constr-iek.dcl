///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_cbl_dsgn_iek: dialog {label = "Кабельные конструкции";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :text {label=""; }//text
    :list_box {key="txt-01"; list=""; width=40; height=22; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Типоразмер"; key="ptxt-021";}
    :text {label=""; key="ptxt-022";}
    :text {label=""; key="ptxt-023";}//text
    :list_box {key="txt-02"; list=""; width=18; height=22; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул"; key="ptxt-031";}
    :text {label=""; key="ptxt-032";}
    :text {label=""; key="ptxt-033";}//text
    :list_box {key="txt-03"; list=""; width=24; height=22; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Длина, мм"; key="ptxt-041";}
    :text {label=""; key="ptxt-042";}
    :text {label=""; key="ptxt-043";}//text
    :list_box {key="txt-04"; list=""; width=22; height=22; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Несущая"; key="ptxt-051";}
    :text {label="способность,"; key="ptxt-052";}
    :text {label="кг";  key="ptxt-053";}//text
    :list_box {key="txt-05"; list=""; width=22; height=22; value=0;}//list_box
  }//column  
  
  :column {label="";
    :text {label="Масса, кг";}
    :text {label="";}
    :text {label="";}//text
    :list_box {key="txt-99"; list=""; width=10; height=22; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label=""; }//text
		:text {label=""; }//text
		:list_box {label=""; key="txt-901"; list=""; width=60; height=22; value= "0";}
	}//column
}//row

:row {label="";
	:column {label="";
		:text {label="Описание";}//text
		:list_box {key="txt-900"; list=""; width=14; height=5; value=0;}//list_box
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ ЧРО"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
