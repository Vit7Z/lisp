///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_swtch_series_k: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Серия";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=7; value=0;}
  }//column
  
  :column {label="";
    :text {label="Артикул"; key="ptxt-011";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}
  }//column

  :column {label="";
    :text {label="Кол.";}
    :text {label="полюсов";}
    :list_box {key="txt-03"; list=""; width=10; height=7; value=0;}
  }//column

  :column {label="";
    :text {label="Положения";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=10; height=7; value=0;}
  }//column
 
  :column {label="";
    :text {label="Ток. номин.";}
    :text {label="ток, А";}
    :list_box {key="txt-05"; list=""; width=10; height=7; value=0;}
  }//column

  :column {label="";
    :text {label="Самовозврат";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=10; height=7; value=0;}
  }//column
}//row


:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=7; value= "0";}
}//column

:row {label="";
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
