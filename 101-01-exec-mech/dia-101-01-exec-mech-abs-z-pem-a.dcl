///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_exec_mech_pem_a: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-00"; list=""; width=10; height=20; value=0;}
  }//column

  :column {label="";
    :text {label="Крутящий";}
    :text {label="момент,";}
    :text {label="Нм";}
    :list_box {key="txt-01"; list=""; width=15; height=20; value=0;}
  }//column
  
  :column {label="";
    :text {label="Частота";}
    :text {label="вращения,";}
    :text {label="об/мин";}
    :list_box {key="txt-02"; list=""; width=15; height=20; value=0;}
  }//column

  :column {label="";
    :text {label="Число оборотов";}
    :text {label="для закрытия";}
    :text {label="(открытия), об";}
    :list_box {key="txt-03"; list=""; width=20; height=20; value=0;}
  }//column
 
  :column {label="";
    :text {label="Потр.";}
    :text {label="мощность,";}
    :text {label="кВт";}
    :list_box {key="txt-04"; list=""; width=15; height=20; value=0;}
  }//column  
 
  :column {label="";
    :text {label="Iном.,";}
    :text {label="А";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=15; height=20; value=0;}
  }//column  
 
  :column {label="";
    :text {label="Iпуск.,";}
    :text {label="А";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=15; height=20; value=0;}
  }//column  

  :column {label="";
    :text {label="Вид и размер";}
    :text {label="выходного";}
    :text {label="вала";}
    :list_box {key="txt-07"; list=""; width=20; height=20; value=0;}
  }//column

  :column {label="";
    :text {label="Дополнительно";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=50; height=20; value=0;}
  }//column
  
  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :text {label="";}
    :list_box {key="txt-09"; list=""; width=10; height=20; value=0;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-071"; value="КИМ - Контроллер исполнительного механизма";}
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
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
