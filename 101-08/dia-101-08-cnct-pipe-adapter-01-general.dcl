///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_connecting_pipe_adapter: dialog {label = "Ниппельные соединения";

:row {label="";
  :column {label="";
    :text {label="Обозначение"; key="ptxt-011";}
    :text {label=""; key="ptxt-012";} 
    :list_box {key="txt-01"; list=""; width=18; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Присоед."; key="ptxt-021";}
    :text {label="вход"; key="ptxt-022";}
    :list_box {key="txt-02"; list=""; width=18; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Присоед."; key="ptxt-031";}
    :text {label="выход"; key="ptxt-032";}
    :list_box {key="txt-03"; list=""; width=18; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Материал"; key="ptxt-041";}
    :text {label=""; key="ptxt-042";}

    :list_box {key="txt-04"; list=""; width=18; height=10; value=0;}//list_box
  }//column  
  
  :column {label="";
    :text {label="Давление,"; key="ptxt-051";}
    :text {label="кгс/см2"; key="ptxt-052";}
    :list_box {key="txt-05"; list=""; width=18; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Температура,"; key="ptxt-061";}
    :text {label="С"; key="ptxt-062";}
    :list_box {key="txt-06"; list=""; width=18; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Производитель"; key="ptxt-071";}
    :text {label=""; key="ptxt-072";}
    :list_box {key="txt-07"; list=""; width=18; height=10; value=0;}//list_box
  }//column

}//row

:row {label="";
	:text {label=""; key="ptxt-081";}
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=40; height=10; value= "0";}
	}//column
}//row

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
