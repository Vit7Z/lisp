///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_owen_lug: dialog {label = "Бобышки \"Овен\"";

:row {label="";
  :column {label="";
    :text {label="Тип";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Конструктивное исполнение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=40; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Резьба";}
    :text {label="присоединения";}
    :list_box {key="txt-03"; list=""; width=15; height=10; value=0;}//list_box
  }//column 

  :column {label="";
    :text {label="Высота";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=10; height=10; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Материал"; }//text
		:text {label=""; }//text
		:list_box {label=""; key="txt-05"; list=""; width=20; height=10; value= "0";}
	}//column
}//row

:row {label="";
	:column {
		:text {label="Примечание";}
		:list_box {label=""; key="txt-900"; list=""; height=4; width=50; value= "";}
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=40; height=7; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
