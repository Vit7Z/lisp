///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_eja_110: dialog {label = "Yokogawa EJA110";


:row {label="";
  :column {label="Измеряемая";
    :text {label=" среда";}
    :list_box {key="txt-10"; list=""; width=16; height=8; value=0;}//list_box
  }//column  
    
  :column {label="Температура"; width=3; children_fixed_width=true;
    :text {label=" изм. среды, C";}
    :edit_box {label="Min "; key="txt-31"; list=""; value= "+5";}
    :edit_box {label="Max"; key="txt-32"; list=""; value= "+150";}
    :row {label=""; height=4;}    
  }//column   
  
  :column {label="Макс. статическое";
    :text {label=" давление, МПа";}
    :edit_box {key="txt-33"; list=""; width=3; value= "1,6";}//list_box
    :row {label=""; height=6;}
  }//column

  :column {label="Диапазон шкалы";
    :text {label=" датчика";}
    :list_box {key="txt-11"; list=""; width=5; height=8; value=0;}//list_box
    }//column
  
  :column {label="Требуемая рабочая";
    :text {label=" шкала";}
    :edit_box {label="Min "; key="txt-34"; list=""; value= "0,1";}
    :edit_box {label="Max"; key="txt-35"; list=""; value= "1,6";}
    :row {label=""; height=4;}
  }//column
    
  :column {label="Погрешность";
    :text {label="";}
    :list_box {key="txt-12"; list=""; width=5; height=8; value=0;}//list_box
  }//column

  :column {label="Выходной ";
    :text {label=" сигнал";}
    :list_box {key="txt-20"; list=""; width=20; height=8; value=0;}//list_box
  }//column
}//row

:row {label=""; height=1;}

:row {label="";


  :column {label="Электрический";
    :text {label=" ввод";}
    :list_box {key="txt-43"; list=""; width=40; height=10;}
  }//column  
  
    :column {label="Индикатор";
    :text {label="";}
    :list_box {key="txt-41"; list=""; width=32; height=10; value=0;}
  }//column  
}//row

:row {label="";

  :column {label="Исполнение";
    :text {label=" датчика";}
    :list_box {key="txt-40"; list=""; width=22; height=8; value=0;}
  }//column

  :column {label="Материал";
    :text {label=" частей";}
    :list_box {key="txt-42"; list=""; width=64; height=10; value=0;}
  }//column

}//row

:row {label=""; height=1;}

:row {label="";
  :row {label="Подсоединение к процессу";
    :column {label="";
      :text {label="Тип";}
      :text {label=" подсоединения";}
      :list_box {key="txt-50"; list="Импульсная трубка"; width=8; height=7; value=0;}
    }//column
 
    :column {label="";
      :text {label="Монтаж импульсных";}
      :text {label="трубок";}
      :list_box {key="txt-52"; list=""; width=10; height=7; value=0;}
    }//column

    :column {label="";
      :text {label="Вентильный";}
      :text {label="блок";}
      :list_box {key="txt-54"; list=""; width=8; height=7; value=0;}
    }//column

  :column {label="";
    :text {label="Присоединительная";}
    :text {label="резьба";}
    :list_box {key="txt-51"; list=""; width=8; height=7; value=0;}
  }//column

  }//row
  
  :column {label="Монтажный";
    :text {label=" кронштейн";}
    :text {label="";}
    :list_box {key="txt-60"; list=""; width=8; height=7; value=0;}
  }//column  
}//row

ok_cancel;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
