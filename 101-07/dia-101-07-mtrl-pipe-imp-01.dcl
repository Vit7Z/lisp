///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_07_mtrl_pipe_imp_01: dialog {label = "Труба импульсная";

:row {label="";
  :column {label="";
    :text {label="Документ";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Нар. диаметр х"; key="ptxt-21";}
    :text {label="Толщ. стенки,"; key="ptxt-22";}
    :text {label="мм"; key="ptxt-23";}
    :list_box {key="txt-02"; list=""; width=15; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Масса"; key="ptxt-31";}
    :text {label="1м, кг"; key="ptxt-32";}
    :text {label=""; key="ptxt-33";}
    :list_box {key="txt-03"; list=""; width=8; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Тип трубы"; key="ptxt-41";}
    :text {label=""; key="ptxt-42";}
    :text {label=""; key="ptxt-43";}
    :list_box {key="txt-04"; list=""; width=16; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Материал"; key="ptxt-51";}
    :text {label=""; key="ptxt-52";}
    :text {label=""; key="ptxt-53";}
    :list_box {key="txt-05"; list=""; width=22; height=10; value=0;}//list_box
  }//column
}//row

:row {label="";
	:list_box {key="txt-900"; list=""; width=22; height=5; value=0;}//list_box
}//row

:column {label="";
		:text {label="Выбрано"; }
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="ПЭ ЧРО"; key="but3"; height=1;}
	:button {label="СПЦФ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
