///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_eja_530_etalon: dialog {label = "Эталон EJA310a";

:row {label="";
  :column {label="";
    :text {label="Измеряемая";}
    :text {label="cреда";}
    :popup_list {key="txt-10"; list=""; width=20; height=1; value=0;}
  }//column
  
  :column {label="";
    :text {label="Температура изм.";}
    :text {label="среды, C";}
    :row {label="";
    	:edit_box {label="Min "; key="txt-11"; height=1; value= "+5";}
    	:edit_box {label="Max"; key="txt-12"; height=1; value= "+150";}
		}//row
  }//column
  
  :column {label="";
    :text {label="Температура окр.";}
    :text {label="среды, C";}
    	:row {label="";
    		:edit_box {label="Min "; key="txt-13"; height=1; value= "+5";}
    		:edit_box {label="Max"; key="txt-14"; height=1; value= "+40";}
		}//row
  }//column 

  :column {label="";
    :text {label="Выходной сигнал";}
    :popup_list {key="txt-15"; list=""; width=28; height=1; value=0;}
  }//column

  :column {label="";
    :text {label="Пределы измерений датчика";}
    :text {label="(пределы перенастройки), МПа";}
    :popup_list {key="txt-16"; list=""; width=28; height=1; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Требуемый диапазон";}
    :text {label="измерений, кгс/см2";}
    :row {label="";
    	:edit_box {label="Min "; key="txt-19"; height=1; value= "";}
    	:edit_box {label="Max"; key="txt-110"; height=1; value= "";}
		}//row
  }//column  
  
}//row

:row {label=""; height=1;}

:row {label="";

  :column {label="Исполнение по материалам";
    :list_box {key="txt-17"; list=""; width=72; height=9; value=0;}
  }//column
  
    :column {label="Соединение с процессом";
    :list_box {key="txt-18"; list=""; width=64; height=9; value=0;}
  }//column

  :column {label="Исполнение";
    :list_box {key="txt-33"; list=""; width=16; height=9; value=0;}
  }//column

}//row

:row {label=""; height=1;}

:row {label="";
  
  :column {label="Материалы стяжных";
    :text {label="болтов и гаек";}
    :list_box {key="txt-21"; list=""; width=28; height=8; value=0;}
  }//column

  :column {label="Положение";
    :text {label="при монтаже";}
    :list_box {key="txt-22"; list=""; width=64; height=8; value=0;}
  }//column

  :column {label="Резьба отверстий под";
    :text {label="кабельный ввод";}
    :list_box {key="txt-23"; list=""; width=25; height=8; value=0;}
  }//column
}//row

:row {label=""; height=1;}

:row {label="";

  :column {label="Монтажный кронштейн";
    :list_box {key="txt-25"; list=""; width=8; height=8; value=0;}
  }//column 

  :column {label="Поверка";
    :list_box {key="txt-31"; list=""; width=30; height=8; value=0;}
  }//column

  :column {label="Точность";
    :list_box {key="txt-32"; list=""; width=5; height=8; value=0;}
  }//column  
  
  :column {label="Индикатор";
    :list_box {key="txt-24"; list=""; width=30; height=8; value=0;}
  }//column
}//row

:row {label=""; height=1;}

:row {label="";

  :column {label="Для работы с кислородом";
    :list_box {key="txt-34"; list=""; width=66; height=4; is_enabled=false;}
  }//column  
  
  :column {label="Нестандартная калибровка";
    :list_box {key="txt-35"; list=""; width=10; height=4; is_enabled=false;}
  }//column
  
  :column {label="Корпус электроного блока";
    :list_box {key="txt-36"; list=""; width=10; height=4; is_enabled=false;}
  }//column    
}//row

ok_cancel;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
