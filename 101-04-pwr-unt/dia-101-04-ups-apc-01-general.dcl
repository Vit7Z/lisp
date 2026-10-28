///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_apc: dialog {label = "APC";

:row {label="";
  :column {label="";
    :text {label="Тип";}
    :text {label="оборудования";}
    :list_box {key="txt-01"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Обозначение"; key="htxt-021";}
    :text {label=""; key="htxt-022";}
    :list_box {key="txt-02"; list=""; width=35; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул"; key="htxt-031";}
    :text {label=""; key="htxt-032";}
    :list_box {key="txt-03"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Uвх.,"; key="htxt-041";}
    :text {label="В"; key="htxt-042";}
    :list_box {key="txt-04"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Мощность"; key="htxt-051";}
    :text {label=""; key="htxt-052";}
    :list_box {key="txt-05"; list=""; width=20; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=5; height=10; value=0;}//list_box
  }//column  
}//row

:row {label=""; height=1;
	:column {label="";
		:text {label="Описание"; }//text
		:list_box {label=""; key="txt-1001"; list=""; width=22; height=5; value= "0";}
	}//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=22; height=9; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
