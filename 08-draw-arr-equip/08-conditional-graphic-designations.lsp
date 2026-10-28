;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:08-conditional-graphic-designations

( / adoc crnt-celtscale crnt-celtype crnt-clayer dcl-id lin-1 lin-2 lin-3 lin-4 lin-5 pnt-ins rctn-1 rctn-2 txt-00 txt-01 txt-02 
txt-03 txt-04 txt-05 txt-06 txt-07 txt-08 txt-09 txt-1 txt-10 txt-11 txt-12 txt-13 txt-2 txt-3 x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(if (= (tblsearch "block" "уго-табл-шапка" ) nil)
	(progn				; если данного блока нет
		(setvar	"OSMODE" 0)
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_RECTANGLE" '(0 -8) '(-145 -23))
		(setq rctn-1 (entlast))
		(command "_RECTANGLE" '(-145 -8) '(-185 -23))
		(setq rctn-2 (entlast))	
		
  	(setvar "CELWEIGHT" -1)
		
		(command "_TEXT" "_MC" '(-165 -15.5) 3.5 0 "Обозначение")
		(setq txt-1 (entlast))
		(command "_TEXT" "_MC" '(-72.5 -15.5) 3.5 0 "Наименование")
		(setq txt-2 (entlast))
		(command "_TEXT" "_BL" '(-184 -8) 3.5 0 "Условные обозначения")
		(setq txt-3 (entlast))
		
		(command "_block" "уго-табл-шапка"
			 '(0 0)  rctn-1 rctn-2 txt-1 txt-2 txt-3 "")	
	); end progn
); end if

(if (= (tblsearch "block" "уго-табл-строка" ) nil)
	(progn				; если данного блока нет
		(setvar	"OSMODE" 0)
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_.line" '(-40 0) '(-40 -10) "")
		(setq lin-1 (entlast))
		(command "_.line" '(0 0) '(0 -10) "")
		(setq lin-2 (entlast))
		(command "_.line" '(145 0) '(145 -10) "")
		(setq lin-3 (entlast))

		(setvar "CELWEIGHT" -1)
		(command "_.line" '(-40 -10) '(0 -10) "")
		(setq lin-4 (entlast))
		(command "_.line" '(0 -10) '(145 -10) "")
		(setq lin-5 (entlast))

  	(command "_block" "уго-табл-строка"
			 '(0 0)  lin-1 lin-2 lin-3 lin-4 lin-5 "")
	); end progn
); end if

(if (< (setq dcl-id (load_dialog "dia-08-conditional-graphic-designations.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_cond_graphic_design" dcl-id))
		(exit)
);if

(action_tile "accept"
  (strcat "(setq txt-00 (get_tile \"txt-00\"))"
  				"(setq txt-01 (get_tile \"txt-01\"))"
          "(setq txt-02 (get_tile \"txt-02\"))"
          "(setq txt-03 (get_tile \"txt-03\"))"
          "(setq txt-04 (get_tile \"txt-04\"))"
          "(setq txt-05 (get_tile \"txt-05\"))"
          "(setq txt-06 (get_tile \"txt-06\"))"
          "(setq txt-07 (get_tile \"txt-07\"))"
          "(setq txt-08 (get_tile \"txt-08\"))"
          "(setq txt-09 (get_tile \"txt-09\"))"
          "(setq txt-10 (get_tile \"txt-10\"))"
          "(setq txt-11 (get_tile \"txt-11\"))"
          "(setq txt-12 (get_tile \"txt-12\"))"
          "(setq txt-13 (get_tile \"txt-13\"))"
          "(setq txt-14 (get_tile \"txt-14\"))"
          "(setq txt-15 (get_tile \"txt-15\"))"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "cancel"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setvar "osmode" 6199)
(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
			x-pnt-ins (nth 0 pnt-ins)
			y-pnt-ins (nth 1 pnt-ins)
);setq

(setvar "osmode" 0)

(if (= txt-00 "0")
  (progn
    (setq x-pnt-ins (+ x-pnt-ins 145)
		);setq
  );progn
);if

(if (= txt-00 "1")
  (progn
    (command "_insert" "уго-табл-шапка" "_X" 1 "_Y" 1 "_Z" 1 pnt-ins 0)
    (setq y-pnt-ins (- y-pnt-ins 23)
		);setq
  );progn
);if

(if (= txt-01 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-01)
    (command "_insert" "точка-2мм" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 165) (- y-pnt-ins 5)) 0)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Отборное устройство (закладная конструкция)")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-02 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-02)
    (command "_insert" "датчик-чро" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 165) (- y-pnt-ins 6.5)) 0)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Прибор, установленный по месту")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-03 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (command "_RECTANGLE" (list (- x-pnt-ins 171) (- y-pnt-ins 3)) (list (- x-pnt-ins 159) (- y-pnt-ins 7)))
    (command "_TEXT" "_MC" (list (- x-pnt-ins 165) (- y-pnt-ins 5)) 2.5 0 "25-А")
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Обозначение кабеля по схеме (схемам) соединений внешних проводок")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-04 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-03)
    (command "_insert" "коробка-соединит-чро" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 165) (- y-pnt-ins 6.5)) 0)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Коробка соединительная")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-05 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-04)
    (command "_insert" "проводки-через-стену-чро" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 163) (- y-pnt-ins 5)) 0)
    (setvar "CELWEIGHT" 60)
    (command "_line" (list (- x-pnt-ins 163) (- y-pnt-ins 5)) (list (- x-pnt-ins 167) (- y-pnt-ins 5)) "")
    (setvar "CELWEIGHT" -1)
    (command "_insert" "проводки-через-стену-чро" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 167) (- y-pnt-ins 5)) 180)
    (command "_line" (list (- x-pnt-ins 167) (- y-pnt-ins 2)) (list (- x-pnt-ins 167) (- y-pnt-ins 8)) "");верт линии
    (command "_line" (list (- x-pnt-ins 163) (- y-pnt-ins 2)) (list (- x-pnt-ins 163) (- y-pnt-ins 8)) "")
    (command "_line" (list (- x-pnt-ins 164) (- y-pnt-ins 2)) (list (- x-pnt-ins 160) (- y-pnt-ins 2)) "");гориз линии верхн
    (command "_line" (list (- x-pnt-ins 166) (- y-pnt-ins 2)) (list (- x-pnt-ins 170) (- y-pnt-ins 2)) "")
    (command "_line" (list (- x-pnt-ins 164) (- y-pnt-ins 8)) (list (- x-pnt-ins 160) (- y-pnt-ins 8)) "");гориз линии низ
    (command "_line" (list (- x-pnt-ins 166) (- y-pnt-ins 8)) (list (- x-pnt-ins 170) (- y-pnt-ins 8)) "")
    (command "_insert" "лин-разрыв-вар-1" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 165) (- y-pnt-ins 2)) 0)
    (command "_insert" "лин-разрыв-вар-1" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 165) (- y-pnt-ins 8)) 0)    
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводка(и) в патрубке через стену")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-06 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-05)
    (command "_insert" "проводки-уходят-вверх" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 167.5) (- y-pnt-ins 7.5)) 0)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводка уходит на более высокую отметку")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-07 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-06)
    (command "_insert" "проводки-уходят-вверх-1" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 167.5) (- y-pnt-ins 7.5)) 0)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводка приходит с более низкой отметки")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-08 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-07)
    (command "_insert" "проводки-уходят-вниз" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 162.5) (- y-pnt-ins 2.5)) 0)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводка уходит на более низкую отметку")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-09 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-08)
    (command "_insert" "проводки-уходят-вниз-1" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 162.5) (- y-pnt-ins 2.5)) 0)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводка приходит с более высокой отметки")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-10 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (setq crnt-clayer (getvar "clayer")
          crnt-celtype (getvar "celtype")
			    crnt-celtscale (getvar "celtscale")
    );setq
    (setvar "osmode" 0)
    (if (= (tblsearch "layer" "arngment-equip") nil)
	    (command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" ""); создаем слой
	    (command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
    );if
    (if (= (tblsearch "ltype" "acad_iso02w100") nil)
		  (command "_linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
	  );if
    (setvar "CELWEIGHT" 60)
    (setvar "celtscale" 0.4)
    (setvar "celtype" "acad_iso02w100")
    (command "_line" (list (- x-pnt-ins 155) (- y-pnt-ins 5.5)) (list (- x-pnt-ins 175) (- y-pnt-ins 5.5)) "")
    (setvar "CELWEIGHT" -1)
    (setvar "celtype" crnt-celtype)
    (setvar "celtscale" crnt-celtscale)
    (command "_circle" (list (- x-pnt-ins 165) (- y-pnt-ins 4.5)) 0.75)
    (setvar "clayer" crnt-clayer)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводки проложить в полу (под площадкой) в трубе")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-11 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (setq crnt-clayer (getvar "clayer")
          crnt-celtype (getvar "celtype")
			    crnt-celtscale (getvar "celtscale")
    );setq
    (setvar "osmode" 0)
    (if (= (tblsearch "layer" "arngment-equip") nil)
	    (command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" ""); создаем слой
	    (command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
    );if
    (setvar "CELWEIGHT" 60)
    (command "_line" (list (- x-pnt-ins 155) (- y-pnt-ins 5.5)) (list (- x-pnt-ins 175) (- y-pnt-ins 5.5)) "")
    (setvar "CELWEIGHT" -1)
    (command "_circle" (list (- x-pnt-ins 165) (- y-pnt-ins 4.5)) 0.75)
    (setvar "clayer" crnt-clayer)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводки проложить в трубе")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-12 "1")
  (progn
    (setq crnt-clayer (getvar "clayer")
    );setq
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-09)
    (command "_insert" "проводки-в-коробе-чро" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 165) (- y-pnt-ins 5)) 0)
    (if (= (tblsearch "layer" "arngment-equip") nil)
	    (command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" ""); создаем слой
	    (command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
    );if
    (setvar "CELWEIGHT" 60)
    (command "_line" (list (- x-pnt-ins 155) (- y-pnt-ins 5)) (list (- x-pnt-ins 175) (- y-pnt-ins 5)) "")
    (setvar "CELWEIGHT" -1)
    (setvar "clayer" crnt-clayer)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводки проложить в лотке (коробе) с крышкой")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-13 "1")
  (progn
    (setq crnt-clayer (getvar "clayer")
    );setq
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (08-conditional-graphic-designations-10)
    (command "_insert" "проводки-в-лотке-чро" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 165) (- y-pnt-ins 5)) 0)
    (if (= (tblsearch "layer" "arngment-equip") nil)
	    (command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" ""); создаем слой
	    (command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
    );if
    (setvar "CELWEIGHT" 60)
    (command "_line" (list (- x-pnt-ins 155) (- y-pnt-ins 5)) (list (- x-pnt-ins 175) (- y-pnt-ins 5)) "")
    (setvar "CELWEIGHT" -1)
    (setvar "clayer" crnt-clayer)
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Проводки проложить в швеллере перфорированном")
    (setq y-pnt-ins (- y-pnt-ins 10)
    );setq
  );progn
);if

(if (= txt-14 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (if (= (tblsearch "layer" "arngment-equip") nil)
			(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" ""); создаем слой
			(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
		);if
		(command "_rectangle" (list (- x-pnt-ins 171) (- y-pnt-ins 2)) (list (- x-pnt-ins 159) (- y-pnt-ins 8)))
		(command "_rectangle" (list (- x-pnt-ins 171) (- y-pnt-ins 2)) (list (- x-pnt-ins 159) (- y-pnt-ins 3)))
		(command "_layer" "Установить" "0" "")
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Шкаф (щит, панель) одностороннего обслуживания")
    (setq y-pnt-ins (- y-pnt-ins 10)
		);setq
  );progn
);if

(if (= txt-15 "1")
  (progn
    (command "_insert" "уго-табл-строка" "_X" 1 "_Y" 1 "_Z" 1 (list (- x-pnt-ins 145) y-pnt-ins) 0)
    (if (= (tblsearch "layer" "arngment-equip") nil)
			(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" ""); создаем слой
			(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
		);if
         
    (command "_rectangle" (list (- x-pnt-ins 171) (- y-pnt-ins 2)) (list (- x-pnt-ins 159) (- y-pnt-ins 8)))
		(command "_rectangle" (list (- x-pnt-ins 171) (- y-pnt-ins 2)) (list (- x-pnt-ins 159) (- y-pnt-ins 3)))
		(command "_rectangle" (list (- x-pnt-ins 171) (- y-pnt-ins 7)) (list (- x-pnt-ins 159) (- y-pnt-ins 8)))
		(command "_layer" "Установить" "0" "")
    (command "_text" "_ML" (list (- x-pnt-ins 144) (- y-pnt-ins 5)) 2.5 0 "Шкаф (щит, панель) двустороннего обслуживания")
    (setq y-pnt-ins (- y-pnt-ins 10)
		);setq
  );progn
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-01

( / circle-1 hatch-1)

(if	(= (tblsearch "block" "точка-2мм") nil)
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
    (setvar "osmode" 0)
    (command "_circle" '(0 0) 1)
    (setq circle-1 (entlast))
    (command "_hatch" "solid" circle-1 "")
    (setq hatch-1 (entlast))
    (command "_block" "точка-2мм" '(0 0) circle-1 hatch-1 "")
  ) ; конец progn
);if

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-02

( / crnt-clayer hatch-1 rctngl-1 rctngl-2)

(setq crnt-clayer (getvar "clayer")
);setq

(if (= (tblsearch "layer" "arngment-equip") nil)
  (command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							            "Установить" "arngment-equip" ""); создаем слой
  (command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
);if
(setvar "osmode" 0)
(if (= (tblsearch "block" "датчик-чро" ) nil)
  (progn
    (command "_.RECTANGLE" '(-3 3) '(3 1))
    (setq rctngl-1 (entlast))
    (command "_.RECTANGLE" '(-3 1) '(3 0))
    (setq rctngl-2 (entlast))
    (command "_hatch" "solid" rctngl-2 "")
    (setq hatch-1 (entlast))
    (command "_block" "датчик-чро" '(0 0) rctngl-1	rctngl-2 hatch-1 "")
  );progn
);if

(setvar "clayer" crnt-clayer)
(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-03

( / crnt-clayer hatch-1 hatch-2 line-1 line-2 line-3 line-4 line-5 line-6 line-7)

(setq crnt-clayer (getvar "clayer")
) ; конец setq

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							"Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
); end if

(setvar "osmode" 0)

(if (= (tblsearch "block" "коробка-соединит-чро" ) nil)
	(progn
		(command "_.LINE" '(0 0) '(-3 0) "")
		(setq line-1 (entlast))
		(command "_.LINE" '(-3 0) '(-3 3) "")
		(setq line-2 (entlast))
		(command "_.LINE" '(-3 3) '(0 0) "")
		(setq line-3 (entlast))
		(command "_.LINE" '(0 0) '(3 0) "")
		(setq line-4 (entlast))
		(command "_.LINE" '(3 0) '(3 3) "")
		(setq line-5 (entlast))
		(command "_.LINE" '(3 3) '(0 0) "")
		(setq line-6 (entlast))
		(command "_.LINE" '(-3 3) '(3 3) "")
		(setq line-7 (entlast))

		(command "_hatch" "solid" line-1 line-2 line-3 "")
		(setq hatch-1 (entlast))
		(command "_hatch" "solid" line-4 line-5 line-6 "")
		(setq hatch-2 (entlast))

		(command "_block" "коробка-соединит-чро"	'(0 0) line-1 line-2	line-3 line-4 line-5 line-6	line-7 hatch-1 hatch-2 "")
	); end progn
) ; end if

(setvar "clayer" crnt-clayer)

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-04

( / crnt-clayer line-1 line-2 line-3)

(setq crnt-clayer (getvar "clayer")
);setq

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							"Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
); end if

(setvar "osmode" 0)

(if (= (tblsearch "block" "проводки-через-стену-чро" ) nil)
	(progn
		(setvar "CELWEIGHT" 60)
		(command "_.LINE" '(0 0) '(1 0) "")
		(setq line-1 (entlast))
		(command "_.LINE" '(1 1) '(1 -1) "")
		(setq line-2 (entlast))
		(setvar "CELWEIGHT" -1)
		(command "_block" "проводки-через-стену-чро" '(0 0) line-1 line-2 "")
	) ; конец progn
) ; конец if

(if (= (tblsearch "block" "лин-разрыв-вар-1" ) nil)
	(progn				; если данного блока нет
		(command "_line" '(-1 0) '(-0.5 -1) "")
		(setq line-1 (entlast))
		(command "_line" '(-0.5 -1) '(0.5 1) "")
		(setq line-2 (entlast))
		(command "_line" '(0.5 1) '(1 0) "")
		(setq line-3 (entlast))
		(command "_block" "лин-разрыв-вар-1" '(0 0) line-1 line-2 line-3 "")
	); end progn
); end if

(setvar "clayer" crnt-clayer)

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-05

( / circle-1 crnt-clayer hatch-1 line-1 line-2)

(setq crnt-clayer (getvar "clayer")
);setq

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							"Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
); end if

(setvar "osmode" 0)

(if (= (tblsearch "block" "проводки-уходят-вверх" ) nil)
	(progn
		(command "_circle" '(0 0) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_.LINE" '(0 0) '(2 2) "")
		(setq line-1 (entlast))
		(command "_.PLINE" '(2 2) "_w" 2 0 '(5 5) "")
		(setq line-2 (entlast))
		(command "_block" "проводки-уходят-вверх" '(0 0) circle-1 hatch-1 line-1 line-2 "")
	) ; конец progn
) ; конец if

(setvar "clayer" crnt-clayer)

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-06

( / circle-1 crnt-clayer hatch-1 line-1 line-2)

(setq crnt-clayer (getvar "clayer")
) ; конец setq

(setvar "osmode" 0)

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
); end if

(if (= (tblsearch "block" "проводки-уходят-вверх-1" ) nil)
	(progn
		(command "_circle" '(5 5) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_.LINE" '(0 0) '(2 2) "")
		(setq line-1 (entlast))
		(command "_.PLINE" '(2 2) "_w" 2 0 '(5 5) "")
		(setq line-2 (entlast))
		(command "_block" "проводки-уходят-вверх-1" '(0 0) circle-1 hatch-1 line-1 line-2 "")
	) ; конец progn
) ; конец if

(setvar "clayer" crnt-clayer)

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-07

( / circle-1 crnt-clayer hatch-1 line-1 line-2)

(setq crnt-clayer (getvar "clayer")
);setq

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
); end if

(if (= (tblsearch "block" "проводки-уходят-вниз" ) nil)
	(progn
		(command "_circle" '(0 0) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_.LINE" '(0 0) '(-2 -2) "")
		(setq line-1 (entlast))
		(command "_.PLINE" '(-2 -2) "_w" 2 0 '(-5 -5) "")
		(setq line-2 (entlast))
		(command "_block" "проводки-уходят-вниз" '(0 0) circle-1 hatch-1 line-1 line-2 "")
	) ; конец progn
) ; конец if

(setvar "clayer" crnt-clayer)

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-08

( / circle-1 crnt-clayer hatch-1 line-1 line-2)

(setq crnt-clayer (getvar "clayer")
);setq

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							"Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
); end if

(setvar "osmode" 0)

(if (= (tblsearch "block" "проводки-уходят-вниз-1" ) nil)
	(progn
		(command "_circle" '(-5 -5) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_.LINE" '(0 0) '(-2 -2) "")
		(setq line-1 (entlast))
		(command "_.PLINE" '(-2 -2) "_w" 2 0 '(-5 -5) "")
		(setq line-2 (entlast))
		(command "_block" "проводки-уходят-вниз-1" '(0 0) circle-1 hatch-1 line-1 line-2 "")
	) ; конец progn
) ; конец if

(setvar "clayer" crnt-clayer)

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-09

( / crnt-clayer hatch-1 hatch-2 line-1 line-2 line-3 line-4 line-5 line-6 pnt-1 rl-1)

(setq crnt-clayer (getvar "clayer")
);setq

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							"Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
); end if

(setvar "osmode" 0)

(if (= (tblsearch "block" "проводки-в-коробе-чро" ) nil)
	(progn
		(setq pnt-1 (list 0 0);вешаем блок на курсор
		) ; конец setq
		(setvar "CELWEIGHT" 60)
		(command "_.rectangle" '(-1 1) '(1 -1) "")
		(setq rl-1 (entlast))
		(command "_.LINE" '(-0.8 1) '(-1.2 1) "")
		(setq line-1 (entlast))
		(command "_.LINE" '(-1.2 1) '(-1 0.8) "")
		(setq line-2 (entlast))
		(command "_.LINE" '(-1 0.8) '(-0.8 1) "")
		(setq line-3 (entlast))
		(command "_.LINE" '(1.2 1) '(0.8 1) "")
		(setq line-4 (entlast))
		(command "_.LINE" '(0.8 1) '(1 0.8) "")
		(setq line-5 (entlast))
		(command "_.LINE" '(1 0.8) '(1.2 1) "")
		(setq line-6 (entlast))
		(command "_hatch" "solid" line-1 line-2 line-3 "")
		(setq hatch-1 (entlast))
		(command "_hatch" "solid" line-4 line-5 line-6 "")
		(setq hatch-2 (entlast))
		(command "_block" "проводки-в-коробе-чро" '(0 0) rl-1 line-1 line-2 line-3 line-4
		line-5 line-6 hatch-1 hatch-2 "")
		(setvar "CELWEIGHT" -1)
	) ; конец progn
) ; конец if

(setvar "clayer" crnt-clayer)

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 08-conditional-graphic-designations-10

( / crnt-clayer line-2 line-3 line-4)

(setq crnt-clayer (getvar "clayer")
);setq

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							"Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
); end if

(setvar "osmode" 0)

(if (= (tblsearch "block" "проводки-в-лотке-чро" ) nil)
	(progn
		(setvar "CELWEIGHT" 60)
		(command "_.LINE" '(-1 1) '(-1 -1) "")
		(setq line-2 (entlast))
		(command "_.LINE" '(-1 -1) '(1 -1) "")
		(setq line-3 (entlast))
		(command "_.LINE" '(1 -1) '(1 1) "")
		(setq line-4 (entlast))
		(setvar "CELWEIGHT" -1)
		(command "_block" "проводки-в-лотке-чро" '(0 0) line-2 line-3 line-4 "")
	) ; конец progn
) ; конец if

(setvar "clayer" crnt-clayer)

(princ)
)
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
