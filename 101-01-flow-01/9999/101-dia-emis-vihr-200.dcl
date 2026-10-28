///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_emis_vihr_200: dialog {label = "ЭМИС ВИХРЬ 200";

:row {label="";
  :column {label="";
    :text {label="Взрывозащита";}
    :text {label="";}
    :list_box {key="txt-11";
     list="";
     width=8;
     height=13;
    }//list_box
  }//column  

  :column {label="";
    :text {label="Типо-";}
    :text {label="размер";}
    :list_box {key="txt-12";
     list="";
     width=5;
     height=13;
    }//list_box
  }//column  

  :column {label="";
    :text {label="Класс";}
    :text {label="точности";}
    :list_box {key="txt-13";
     list="";
     width=3;
     height=13;
    }//list_box
  }//column 

  :column {label="";
    :text {label="Диапазон";}
    :text {label="расхода";}
    :list_box {key="txt-14";
     list="";
     width=15;
     height=13;
    }//list_box
  }//column

  :column {label="";
    :text {label="Измеряемая";}
    :text {label="среда";}
    :list_box {key="txt-15";
     list="";
     width=8;
     height=13;
    }//list_box
  }//column

  :column {label="";
    :text {label="Материал проточ-";}
    :text {label="ной части";}
    :list_box {key="txt-16";
     list="";
     width=13;
     height=13;
    }//list_box
  }//column

  :column {label="";
    :text {label="Соединение с";}
    :text {label="трубопроводом";}
    :list_box {key="txt-17";
     list="";
     width=44;
     height=13;
    }//list_box
  }//column

}//row

:row {label="";

  :column {label="";
    :text {label="Размещение";}
    :text {label="эл. преобразоват.";}
    :list_box {key="txt-21";
     list="";
     width=3;
     height=13;
    }//list_box
  }//column
  
  :column {label="";
    :text {label="Давление";}
    :text {label="среды, МПа";}
    :list_box {key="txt-22";
     list="";
     width=3;
     height=13;
    }//list_box
  }//column

  :column {label="";
    :text {label="Температура";}
    :text {label="среды";}
    :list_box {key="txt-23";
     list="";
     width=3;
     height=13;
    }//list_box
  }//column

  :column {label="";
    :text {label="Индикатор";}
    :text {label="";}
    :list_box {key="txt-24";
     list="";
     width=3;
     height=13;
    }//list_box
  }//column

  :column {label="";
    :text {label="Выходной";}
    :text {label="сигнал";}
    :list_box {key="txt-25";
     list="";
     width=18;
     height=13;
    }//list_box
  }//column

  :column {label="";
    :text {label="Поверка";}
    :text {label="";}
    :list_box {key="txt-26";
     list="";
     width=3;
     height=13;
    }//list_box
  }//column

}//row

:paragraph {key="p1";
  :text_part {label="Ду15 только на t -40...+100 С";}  
}

ok_cancel;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
