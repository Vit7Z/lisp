///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_tmprt_sens_metran_tsmu: dialog {label = "ТСМУ, ТСПУ \"Метран\"";

:row {label="";
  :column {
    :text {label="Модель"; key="ptxt-011";}
    :text {label=""; key="ptxt-012";}
    :text {label=""; key="ptxt-013";}
    :list_box {key="txt-01"; list=""; width=20; height=12; }//list_box
  }//column  

  :column {
    :text {label="Исполнение "; key="ptxt-021";}
    :text {label="защитной"; key="ptxt-022";}
    :text {label="арматуры"; key="ptxt-023";}
    :list_box {key="txt-02"; list=""; width=22; height=12; }//list_box
  }//column

  :column {
    :text {label="Вид"; key="ptxt-031";}
    :text {label="взрыво-"; key="ptxt-032";}
    :text {label="защиты"; key="ptxt-033";}
    :list_box {key="txt-03"; list=""; width=8; height=12; }//list_box
  }//column

  :column {
    :text {label="Длина"; key="ptxt-041";}
    :text {label="монтажной"; key="ptxt-042";}
    :text {label="части, мм."; key="ptxt-043";}
    :list_box {key="txt-04"; list=""; width=7; height=12; }//list_box
  }//column

  :column {
    :text {label="Предел"; key="ptxt-051";}
    :text {label="погрешн."; key="ptxt-052";}
    :text {label=""; key="ptxt-053";}
    :list_box {key="txt-05"; list=""; width=7; height=12; }//list_box
  }//column

  :column {
    :text {label="Материал"; key="ptxt-061";}
    :text {label="защитной"; key="ptxt-062";}
    :text {label="арматуры"; key="ptxt-063";}
    :list_box {key="txt-06"; list=""; width=16; height=12; }//list_box
  }//column

  :column {
    :text {label="Диапазон"; key="ptxt-071";}
    :text {label="температур,"; key="ptxt-072";}
    :text {label="С"; key="ptxt-073";}
    :list_box {key="txt-07"; list=""; width=3; height=12; }//list_box
  }//column  
  
  :column {
    :text {label="Вых."; key="ptxt-081";}
    :text {label="сигнал"; key="ptxt-082";}
    :text {label=""; key="ptxt-083";}
    :list_box {key="txt-08"; list=""; width=3; height=12;}//list_box
  }//column 

  :column {
    :text {label="Монтажный"; key="ptxt-091";}
    :text {label="компл."; key="ptxt-092";}
    :text {label=""; key="ptxt-093";}
    :list_box {key="txt-09"; list=""; width=20; height=12;}//list_box
  }//column  
  
//}//row
//
//:row {label="";
  :column {
    :text {label="Темпера-"; key="ptxt-101";}
    :text {label="турный"; key="ptxt-102";}
    :text {label="класс"; key="ptxt-103";}
    :list_box {key="txt-10"; list=""; width=3; height=12;}//list_box
  }//column
  
  :column {
    :text {label="Климатическое"; key="ptxt-111";}
    :text {label="исполнение"; key="ptxt-112";}
    :text {label=""; key="ptxt-113";}
    :list_box {key="txt-11"; list=""; width=3; height=12;}//list_box
  }//column
  
  :column {
    :text {label="Т окр.";}
    :text {label="среды, C";}
    :text {label="";}
    :edit_box {label=""; key="txt-12-1"; list=""; height=1; width=5; value= "+5";}
    :edit_box {label=""; key="txt-12-2"; list=""; height=1; width=5; value= "+50";}
    :text {label=""; height=7;}
  }//column

  :column {
    :text {label="Диаметр"; key="ptxt-131";}
    :text {label="термо-"; key="ptxt-132";}
    :text {label="баллона"; key="ptxt-133";}
    :list_box {key="txt-13"; list=""; width=3; height=12;}//list_box
  }//column

  :column {
    :text {label="НСХ"; key="ptxt-141";}
    :text {label=""; key="ptxt-142";}
    :text {label=""; key="ptxt-143";}
    :list_box {key="txt-14"; list=""; width=7; height=12;}//list_box
  }//column  
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row

:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
}//row

:column {
  :text {label=""; key="ptxt-24"; value="Установка в расширитель Ду50.";}
}//column

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
