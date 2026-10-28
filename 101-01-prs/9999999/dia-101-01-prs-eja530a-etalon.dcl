///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_eja_530_etalon: dialog {label = "Эталон EJA530a";


:row {label="";
  :column {label="Измеряемая";
    :text {label=" среда";}
    :list_box {key="txt-10"; list=""; width=8; height=7; value=0;}//list_box
  }//column
  
  :column {label="Температура изм.";
    :text {label=" среды, C";}
    :edit_box {label="Min "; key="txt-11"; list=""; height=1; value= "+5";}
    :edit_box {label="Max"; key="txt-12"; list=""; height=1; value= "+150";}
    :text {label=""; height=2;}
  }//column
  
  :column {label="Температура окр.";
    :text {label=" среды, C";}
    :edit_box {label="Min "; key="txt-13"; list=""; height=1; value= "+5";}
    :edit_box {label="Max"; key="txt-14"; list=""; height=1; value= "+40";}
    :text {label=""; height=2;}
  }//column 

  :column {label="Выходной сигнал";
    :text {label="";}
    :list_box {key="txt-15"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="Особенности";
    :text {label=" выходного сигнала";}
    :list_box {key="txt-16"; list=""; width=16; height=7; value=0;}//list_box
  }//column

  :column {label="Пределы измерений датчика";
    :text {label=" (пределы перенастройки)";}
    :list_box {key="txt-17"; list=""; width=5; height=7; value=0;}//list_box
  }//column

  :column {label="Погрешность";
    :text {label="";}
    :list_box {key="txt-18"; list=""; width=5; height=7; value=0;}//list_box
  }//column

}//row

:row {label=""; height=1;}

:row {label="";
  :column {label="Исполнение по материалам";
    :list_box {key="txt-20"; list=""; width=50; height=7; value=0;}
  }//column

  :column {label="Соединение с процессом";
    :list_box {key="txt-21"; list=""; width=44; height=7; value=0;}
  }//column

  :column {label="Кабельный ввод";
    :list_box {key="txt-22"; list=""; width=25; height=7; value=0;}
  }//column

  :column {label="Индикатор";
    :list_box {key="txt-23"; list=""; width=30; height=7; value=0;}
  }//column

  :column {label="Исполнение";
    :list_box {key="txt-24"; list=""; width=30; height=7; value=0;}
  }//column
}//row

:row {label=""; height=1;}

:row {label="";
  :column {label="Монтажный кронштейн";
    :list_box {key="txt-31"; list=""; width=8; height=6; value=0;}
  }//column  
  
  :column {label="Для работы с кислородом";
    :list_box {key="txt-32"; list=""; width=66; height=6; is_enabled=false;}
  }//column  
  
  :column {label="Нестандартная калибровка";
    :list_box {key="txt-33"; list=""; width=10; height=6; is_enabled=false;}
  }//column
  
  :column {label="Корпус электроного блока";
    :list_box {key="txt-34"; list=""; width=10; height=6; is_enabled=false;}
  }//column    
}//row

ok_cancel;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
