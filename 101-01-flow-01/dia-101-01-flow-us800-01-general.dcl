///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_us_800: dialog {label = "US800";

:row {label=""; children_alignment=top;
	:column {
		:text {label="Исполнение ЭБ";}
    :list_box {key="txt-01"; list=""; width=22; height=6; value=0;}//list_box
  }//column

    :column { 
      :text {label="Выходы";}
      :list_box {label=""; key="txt-02"; list=""; width=44; height=6; value= "0";}
    }//column

    :column { 
      :text {label="Uпит.";}
      :list_box {label=""; key="txt-03"; list=""; width=5; height=6; value= "0";}
    }//column
}//row

:row {label="";    
  :column {
    :text {label="Канал 1";}
    :text {label="Ду, мм";}
    :text {label="";}
    :list_box {label=""; key="txt-04-1"; list=""; width=8; height=12; value= "0";}
  }//column

  :column {
    :text {label="";}
    :text {label="Пределы";}
    :text {label="изм., м3/ч";}
    :list_box {label=""; key="txt-05-1"; list=""; width=14; height=12; value= "0";}
  }//column

  :column { 
    :text {label="";}
    :text {label="Материал";}
    :text {label="";}
    :list_box {label=""; key="txt-06-1"; list=""; width=20; height=12; value= "0";}
  }//column
     
  :column {
    :text {label="";}
    :text {label="Соединение";}
    :text {label="";}
    :list_box {label=""; key="txt-07-1"; list=""; width=12; height=12; value= "0";}
    //:spacer {height=0.1;}
  }//column

  :column {
  	:text {label="";}
		:text {label="Длина";}
		:text {label="кабеля, м";}
		:edit_box {key="txt-08-1"; label=""; width=4; height=1; value= "**";}//list_box
		:spacer {height=10;}
  }//column

  :column {
    :text {label="";}
    :text {label="Среда";}
    :text {label="";}
		:edit_box {label=""; key="txt-09-1"; width=4; height=1;}

		:text {label="Температура, С";}
		:row {
   		:edit_box {label=""; key="txt-10-1"; width=4; height=1;}
    	:edit_box {label=""; key="txt-11-1"; width=4; height=1;}
   	}//row
   	
    :text {label="Давление, МПа";}
 		:row {
 			:edit_box {label=""; key="txt-12-1"; width=4; height=1;}
    	:edit_box {label=""; key="txt-13-1"; width=4; height=1;}
		}//row
		
		:text {label="Расход, м3/ч";}
    :row {
    	:edit_box {label=""; key="txt-14-1"; width=4; height=1;}//list_box
      :edit_box {label=""; key="txt-15-1"; width=4; height=1;}//list_box
    }//row
  }//column
  
	:spacer {height=1;}

  :column {
    :text {label="Канал 2"; is_enabled=falshe; key="ltxt-04-1";}
    :text {label="Ду, мм"; is_enabled=falshe; key="ltxt-04-2";}
    :text {label="";}
    :list_box {label=""; key="txt-04-2"; list=""; width=8; height=12; value= "0"; is_enabled=falshe;}
  }//column

  :column {
    :text {label="";}
    :text {label="Пределы изм,"; is_enabled=falshe; key="ltxt-05-1";}
    :text {label="м3/ч"; is_enabled=falshe; key="ltxt-05-2";}
    :list_box {label=""; key="txt-05-2"; list=""; width=14; height=12; value= "0"; is_enabled=falshe;}
  }//column

  :column { 
    :text {label="";}
    :text {label="Материал"; is_enabled=falshe; key="ltxt-06-1";}
    :text {label="";}
    :list_box {label=""; key="txt-06-2"; list=""; width=20; height=12; value= "0"; is_enabled=falshe;}
  }//column
     
  :column {
    :text {label="";}
    :text {label="Соединение"; is_enabled=falshe; key="ltxt-07-1";}
    :text {label="";}
    :list_box {label=""; key="txt-07-2"; list=""; width=12; height=12; value= "0"; is_enabled=falshe;}
    //:spacer {height=0.1;}
  }//column

  :column {
  	:text {label="";}
		:text {label="Длина"; is_enabled=falshe; key="ltxt-08-1";}
		:text {label="кабеля, м"; is_enabled=falshe;  key="ltxt-08-2";}
		:edit_box {key="txt-08-2"; label=""; width=4; height=1; is_enabled=falshe; value= "**";}//list_box
		:spacer {height=10;}
  }//column

  :column {
    :text {label="";}
    :text {label="Среда"; is_enabled=falshe; key="ltxt-09-1";}
    :text {label="";}
		:edit_box {label=""; key="txt-09-2"; width=4; height=1; is_enabled=falshe;}

		:text {label="Температура, С"; is_enabled=falshe; key="ltxt-10-2";}
		:row {
   		:edit_box {label=""; key="txt-10-2"; width=4; height=1; is_enabled=falshe;}
    	:edit_box {label=""; key="txt-11-2"; width=4; height=1; is_enabled=falshe;}
   	}//row
   	
    :text {label="Давление, МПа"; is_enabled=falshe; key="ltxt-12-2";}
 		:row {
 			:edit_box {label=""; key="txt-12-2"; width=4; height=1; is_enabled=falshe;}
    	:edit_box {label=""; key="txt-13-2"; width=4; height=1; is_enabled=falshe;}
		}//row
		
		:text {label="Расход, м3/ч"; is_enabled=falshe; key="ltxt-14-2";}
    :row {
    	:edit_box {label=""; key="txt-14-2"; width=4; height=1; is_enabled=falshe;}//list_box
      :edit_box {label=""; key="txt-15-2"; width=4; height=1; is_enabled=falshe;}//list_box
    }//row
  }//column
  
	:spacer {height=1;}
}//row


:row {label=""; height=1;
	:column { 
		:text {label="Поверка";}
    :list_box {label=""; key="txt-16"; list=""; width=18; height=6; value= "0";}
	}//column

	:column { 
		:text {label="Давление УПР, МПа";}
    :list_box {label=""; key="txt-17"; list=""; width=18; height=6; value= "0";}
	}//column

	:column { 
		:text {label="";}
		:toggle {label="ПЭП IP68"; key="txt-18"; height=1;}
		:toggle {label="ПЭП с шаровым краном (от 200 мм)"; key="txt-19"; height=1; is_enabled=falshe;}
		:toggle {label="ПЭП-У с усиленным сигналом"; key="txt-20"; height=1;}
	}//column
}//row


:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
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
