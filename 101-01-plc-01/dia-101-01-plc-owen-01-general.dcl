///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_plc_owen: dialog {label = "Контроллеры \"Овен\"";

:row {label="";  
  :column {label="";
    :text {label="Тип модуля";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=25; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Аналог."; key="ptxt-031";}
    :text {label="вход"; key="ptxt-032";}
    :list_box {key="txt-03"; list=""; width=8; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Аналог."; key="ptxt-041";}
    :text {label="выход"; key="ptxt-042";}
    :list_box {key="txt-04"; list=""; width=8; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Дискр."; key="ptxt-051";}
    :text {label="выход"; key="ptxt-052";}
    :list_box {key="txt-05"; list=""; width=8; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Дискр."; key="ptxt-061";}
    :text {label="выход"; key="ptxt-062";}
    :list_box {key="txt-06"; list=""; width=8; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Uпит.,";}
    :text {label="В";}
    :list_box {key="txt-07"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Описание";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=84; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=15; value=0;}//list_box
  }//column
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column


:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
