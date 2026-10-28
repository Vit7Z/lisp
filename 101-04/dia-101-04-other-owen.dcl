///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_other_owen: dialog {label = "Рзаное \"ОВЕН\"";

:row {label="";
  :column {label="";
    :text {label="Тип оборудования";}
    :text {label="";}
    :text {label=""; }//text
    :list_box {key="txt-01"; list=""; width=20; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :text {label="";}//text
    :list_box {key="txt-02"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Размеры,"; key="ptxt-031";}
    :text {label="ШxВ, мм."; key="ptxt-032";}
    :text {label=""; key="ptxt-033";}//text
    :list_box {key="txt-03"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Мощность"; key="ptxt-041";}
    :text {label="воздушного"; key="ptxt-042";}
    :text {label="потока, м3/ч"; key="ptxt-043";}//text
    :list_box {key="txt-04"; list=""; width=20; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Эл. питание"; key="ptxt-051";}
    :text {label=""; key="ptxt-052";}
    :text {label="";  key="ptxt-053";}//text
    :list_box {key="txt-05"; list=""; width=20; height=10; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Потр."; key="ptxt-061";}
    :text {label="мощность,"; key="ptxt-062";}
    :text {label="Вт";  key="ptxt-063";}//text
    :list_box {key="txt-06"; list=""; width=14; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :text {label="";}
    :list_box {key="txt-99"; list=""; width=7; height=10; value=0;}//list_box
  }//column

}//row

:row {label="";
	:column {label="";
		:text {label="Описание";}
		:list_box {key="txt-1001"; list=""; height=7; value=0;}//list_box
  }//column
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
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
