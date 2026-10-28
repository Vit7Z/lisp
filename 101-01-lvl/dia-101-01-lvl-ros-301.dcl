///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_lvl_sgnl_device_ros_301: dialog {label = "РОС-301";

:row {label="";

  :column {
    :text {label="Тип";}
    :text {label="электрода";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=16;}//list_box
  }//column
  
  :column {
    :text {label="Исполнение";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=20; height=16;}//list_box
  }//column

  :column {
    :text {label="Давление,";}
    :text {label="МПа";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=20; height=16; is_enabled=falshe;}//list_box
  }//column

  :column {
    :text {label="Температура,";}
    :text {label="°С";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=20; height=16; is_enabled=falshe;}//list_box
  }//column

  :column {
    :text {label="Длина, м";}
    :text {label="";}
    :text {label="Электрод 1";}
    :popup_list {key="txt-06"; list=""; width=20; height=2;}//list_box
    :text {label=""; height=2;}
    
    :text {label="Электрод 2";}
    :popup_list {key="txt-07"; list=""; width=20; height=2;}//list_box
    :text {label=""; height=2;}
    
    :text {label="Электрод 3";}
    :popup_list {key="txt-08"; list=""; width=20; height=2;}//list_box
    //:text {label=""; height=1;}
  }//column

  :column {
    :text {label="Клматическое";}
    :text {label="исполнение,";}
    :text {label="вторичн. прибор";}
    :list_box {key="txt-09"; list=""; width=20; height=16;}//list_box
  }//column

  :column {
    :text {label="Клматическое";}
    :text {label="исполнение,";}
    :text {label="датчик";}
    :list_box {key="txt-10"; list=""; width=20; height=16;}//list_box
  }//column
}//row

:column {
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=58; height=16; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row


}//row

///////////////////////////////////////////////////////////////////////////////////////////////////////////
