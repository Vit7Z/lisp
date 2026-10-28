///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_mtl_box_kspe: dialog {label = "Коробки КСПе(i)";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=15; value=0;}//list_box
  }//column
  
  :column {label="";
  	:text {label="Сальники";}

		:row {label="";
			:column {label="";
				:text {label="М20";}
				:text {label="(6...12мм)";}
				:list_box {key="txt-21"; list=""; width=6; height=15; value=0;}//list_box
			}//column
	
			:column {label="";
				:text {label="М25";}
				:text {label="(13...18мм)";}
				:list_box {key="txt-22"; list=""; width=6; height=15; value=0;}//list_box
			}//column
	
			:column {label="";
				:text {label="М32";}
				:text {label="(14...25мм)";}
				:list_box {key="txt-23"; list=""; width=6; height=15; value=0;}//list_box
			}//column

			:column {label="";
				:text {label="М40";}
				:text {label="(16...22мм)";}
				:list_box {key="txt-24"; list=""; width=6; height=15; value=0;}//list_box
			}//column
		}//row
	}//column

  :column {label="";
    :text {label="Кол.";}
    :text {label="клемм";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=5; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Степень";}
    :text {label="защиты";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=10; height=15; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Маркировка";}
    :text {label="взрывозащиты";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг.";}
    :text {label="";}
    :list_box {key="txt-99"; list=""; width=7; height=15; value=0;}//list_box
  }//column
}//row

:row {label="";
  :column {label="";
    :list_box {key="txt-900"; list=""; width=106; height=5; value=0;}//list_box
  }//column
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=74; height=10; value= "0";}
}//column   

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
