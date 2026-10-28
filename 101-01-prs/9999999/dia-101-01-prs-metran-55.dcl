///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_metran_55: dialog {label = "Датчики давления \"Метран\"";

:row {  
  :column {
    :text {label="Тип датчика";}
    :text {label="";}
		:list_box {key="txt-02"; list=""; width=20; height=13; }//list_box
  }//column  

  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=5; height=13;}//list_box
  }//column  
  
  :column {
    :text {label="Предел";}
    :text {label="изм., МПа";}
    :list_box {key="txt-04"; list=""; width=3; height=13;}//list_box
  }//column
  
  :column {
    :text {label="Код электр.";}
    :text {label="преобраз.";}
    :list_box {key="txt-05"; list=""; width=3; height=13;}//list_box
  }//column 

  :column {
    :text {label="Кислородн.";}
    :text {label="исполнение";}
    :list_box {key="txt-06"; list=""; width=3; height=13;}//list_box
  }//column

  :column {
    :text {label="Климатич.";}
    :text {label="исполнение";}
    :list_box {key="txt-07"; list=""; width=18; height=13;}//list_box
  }//column

  :column {
    :text {label="Погреш-";}
    :text {label="ность";}
    :list_box {key="txt-08"; list=""; width=3; height=13;}//list_box
  }//column

  :column {
    :text {label="Выходной";}
    :text {label="сигнал, мА";}
    :list_box {key="txt-09"; list=""; width=3; height=13;}//list_box
  }//column
  
  :column {
    :text {label="Ввод";}
    :text {label="кабеля";}
    :list_box {key="txt-10"; list=""; width=3; height=13;}//list_box
  }//column

  :column {
    :text {label="Монтажные";}
    :text {label="части";}
    :list_box {key="txt-11"; list=""; width=3; height=13;}//list_box
  }//column
}//row

:column {label="Выбрано    ";
	:list_box {label=""; key="txt-901"; list=""; width=22; height=9; value= "0";}
}//column

:paragraph {key="p1";
  :text_part {label="ДА - Датчик абсолютного давления. ДИ - Датчик избыточного давления. ДВ - Датчик разряжения. ДИВ - Датчик давления-разряжения";}
  :text_part {label="Датчик модели 517 для кислорода не выпускается. Выходной сигнал 0-5мА только для датчика общепромышленного исполнения";}
  :text_part {label="С - Сальниковый ввод, для кабеля диаметром не более 10мм. С2 - Сальниковый ввод с фиксацией кабеля. ШР - Штепсельный разъем";}
  :text_part {label="М20 - Ниппель с накидной гайкой М20х1,5, для соединения по наружному диаметру трубы 14мм. М12 - Штуцер М12х1,5";}
  :text_part {label="Кр - Кронштейн. КБуст - Клапанный блок, установленный на датчик давления. Клапанный блок выбирается отдельно";}
  :text_part {label="Сальниковый ввод (С2), штепсельный разъем (ШР) не используются для датчика Метран-55-Вн-ХХ";}  
}

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
