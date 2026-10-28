///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_05_general: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :list_box {key="txt-00"; list=""; width=40; height=15; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Обозначение";}
    :text {label="условное";}
    :list_box {key="txt-01"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Вход присоед.";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=25; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Выход присоед.";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=25; height=15; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Материал";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=18; height=15; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Ру, МПа";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=10; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Т, °С";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=12; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Ду,";}
    :text {label="мм";}
    :list_box {key="txt-07"; list=""; width=8; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=22; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=15; value=0;}//list_box
  }//column
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=18; height=10; value= "0";}
}//column


:row {label="";
	:column {label="";
		:text {label="Справка";}
		:list_box {key="txt-900"; list=""; width=5; height=4;}//list_box
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
