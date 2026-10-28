///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_sleeve_prtct_termiko: dialog {label = "Гильзы защитные";

:row {label="";
  :column {label="";
    :text {label="Производитель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Давление,";}
    :text {label="МПа";}
    :text {label="";}
    :list_box {key="txt-11"; list=""; width=10; height=20; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Диаметр";}
    :text {label="монтажной";}
    :text {label="части, мм.";}
    :list_box {key="txt-12"; list=""; width=10; height=20; value=0;}//list_box
  }//column 

  :column {label="";
  	:text {label="Длина";}
    :text {label="монтажной";}
    :text {label="части, мм.";}
    :list_box {key="txt-13"; list=""; width=10; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Предельная";}
    :text {label="скорость";}
    :text {label="пара, м/с";}
    :list_box {key="txt-14"; list=""; width=10; height=20; value=0; is_enabled=false;}//list_box
  }//column

  :column {label="";
    :text {label="Предельная";}
    :text {label="скорость";}
    :text {label="воды, м/с";}
    :list_box {key="txt-15"; list=""; width=10; height=20; value=0; is_enabled=false;}//list_box
  }//column

  :column {label="";
    :text {label="Резьба";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-16"; list=""; width=14; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Штуцер";}
    :text {label="передвижной";}
    :text {label="";}
    :list_box {key="txt-17"; list=""; width=10; height=20; value=0;}//list_box
  }//column
}//row

:column {
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=3; height=8; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
