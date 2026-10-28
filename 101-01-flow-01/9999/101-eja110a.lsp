;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:101-eja110a

( / adoc counter dcl-id list-10 list-11 list-12 list-20 list-40 list-41 list-42 list-43 list-51 list-60 p-ins-txt-pos p-ins-txt-q 
pnt-ins p-txt-pos p-txt-q reply str-f txt-10 txt-11 txt-11-1 txt-12 txt-20 txt-20-1 txt-31 txt-32 txt-33 txt-34 txt-35 txt-41 txt-41-1 
txt-42 txt-42-1 txt-43 txt-43-1 txt-51 txt-51-1 txt-60 txt-60-1 txt-ins-1 x-pnt-ins y-pnt-ins ypnt-ins-1)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo

(setq str-f 1
      counter 0
      list-10 (list "Вода" "Насыщенный пар" "Перегретый пар" "Газ природный" "Нефть")
      list-11 (list "0,5...10 кПа" "1...100 кПа" "5...500 кПа" "0,14...14 МПа")
      list-12 (list "0,2" "0,075" "0,12")
      list-20 (list "4...20мА, HART" "4...20мА, BRAIN" "FOUNDATION Fieldbus")
      list-40 (list "Обычное, IP67" "EEx ia IIC T4" "EExd IIC T6" "EExd IIC T6, EEx ia IIC T4")
      list-41 (list "Отсутствует" "ЖК дисплей" "ЖК дисплей с переключат. шкалы")
      list-42 (list "SCS14A (корпус), SUS316L (капусла), SUS316 (дренаж)"
                    "SCS14A (корпус), Hastelloy C-276 (капусла), SUS316 (дренаж)"
                    "SCS14A (корпус), Monel (капусла), SUS316 (дренаж)"
                    "SCS14A (корпус), Tantalum (капусла), SUS316 (дренаж)"
                    "Hastelloy C-276 (корпус), Hastelloy C-276 (капусла), Hastelloy C-276 (дренаж)"
                    "Hastelloy C-276 (корпус), Tantalum (капусла), Hastelloy C-276 (дренаж)"
                    "Monel (корпус), Monel (капусла), Monel (дренаж)")
      list-43 (list "2 отв., 1 заглушка, внутр. резьба М20"
                    "1 отв., внутр. резьба G1/2"
                    "2 отв., без заглушки, внутр. резьба 1/2 NPT"
                    "2 отв., без заглушки, внутр. резьба Pg 13,5"
                    "2 отв., без заглушки, внутр. резьба М20"
                    "2 отв., 1 заглушка, внутр. резьба G1/2"
                    "2 отв., 1 заглушка, внутр. резьба 1/2 NPT"
                    "2 отв., 1 заглушка, внутр. резьба Pg 13,5"
                    )
      list-51 (list "Штуцер, наруж. резьба М20х1,5 DIN 16 288"
                    "Штуцер, внутр. резьба 1/2 NPT"
                    "Штуцер, наруж. резьба 1/2 NPT"
                    "Штуцер, наруж. резьба G1/2 DIN 16 288")
      list-52 (list "Имп. трубки снизу, высок. давл. слева"
                    "Имп. трубки сверху, высок. давл. справа"
                    "Имп. трубки снизу, высок. давл. справа"
                    "Имп. трубки сверху, высок. давл. слева"                    
                    "Имп. трубки гориз., высок. давл. справа"
                    "Имп. трубки гориз., высок. давл. слева")
      list-60 (list "Отсутствует" "SECC (углеродистая сталь)" "SUS304")
);setq

(if (< (setq dcl-id (load_dialog "101-dia-eja110a.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_eja_110" dcl-id))
		(exit)
);if

;среда
(list-filling "txt-10" list-10)
(set_tile "txt-10" "0")

;диапазон шкалы датчика
(list-filling "txt-11" list-11)
(set_tile "txt-11" "0")

;погрешность
(list-filling "txt-12" list-12)
(set_tile "txt-12" "0")

;протокол
(list-filling "txt-20" list-20)
(set_tile "txt-20" "0")

;исполнение
(list-filling "txt-40" list-40)
(set_tile "txt-40" "0")

;индикатор
(list-filling "txt-41" list-41)
(set_tile "txt-41" "0")

;материал
(list-filling "txt-42" list-42)
(set_tile "txt-42" "0")

;ввод кабеля
(list-filling "txt-43" list-43)
(set_tile "txt-43" "0")

;присоединительная резьба
(list-filling "txt-51" list-51)
(set_tile "txt-51" "0")

(list-filling "txt-52" list-52)
(set_tile "txt-52" "0")

;кронштейн
(list-filling "txt-60" list-60)
(set_tile "txt-60" "0")

(action_tile "accept"
  (strcat "(setq txt-10 (nth (atoi (get_tile \"txt-10\")) list-10))"
          "(setq txt-11 (nth (atoi (get_tile \"txt-11\")) list-11))"
          "(setq txt-12 (nth (atoi (get_tile \"txt-12\")) list-12))"
          "(setq txt-20 (nth (atoi (get_tile \"txt-20\")) list-20))"
          "(setq txt-40 (nth (atoi (get_tile \"txt-40\")) list-40))"
          "(setq txt-41 (nth (atoi (get_tile \"txt-41\")) list-41))"
          "(setq txt-42 (nth (atoi (get_tile \"txt-42\")) list-42))"
          "(setq txt-43 (nth (atoi (get_tile \"txt-43\")) list-43))"
          "(setq txt-51 (nth (atoi (get_tile \"txt-51\")) list-51))"
          "(setq txt-60 (nth (atoi (get_tile \"txt-60\")) list-60))"
          "(setq txt-10 (nth (atoi (get_tile \"txt-10\")) list-10))"
          "(setq txt-31 (get_tile \"txt-31\"))"
          "(setq txt-32 (get_tile \"txt-32\"))"
          "(setq txt-33 (get_tile \"txt-33\"))"
          "(setq txt-34 (get_tile \"txt-34\"))"
          "(setq txt-35 (get_tile \"txt-35\"))"
          "(setq txt-12 (nth (atoi (get_tile \"txt-12\")) list-12))"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "cancel"
  (strcat "(done_dialog)"
          "(exit)")
);action_tile

(start_dialog)
(unload_dialog dcl-id)

;//////////////////////////////////////////////////
(if (= txt-20 "4...20мА, HART")
  (setq txt-20-1 "E"
  );setq
);if

(if (= txt-20 "4...20мА, BRAIN")
  (setq txt-20-1 "D"
  );setq
);if

(if (= txt-20 "FOUNDATION Fieldbus")
  (setq txt-20-1 "F"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-11 "0,5...10 кПа")   
  (setq txt-11-1 "L"
  );setq
);if

(if (= txt-11 "1...100 кПа")
  (setq txt-11-1 "M"
  );setq
);if

(if (= txt-11 "5...500 кПа")
  (setq txt-11-1 "H"
  );setq
);if

(if (= txt-11 "0,14...14 МПа")
  (setq txt-11-1 "V"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-42 "SUS316L (раб. штуцер), Hastelloy C-276 (диафр.)")
  (setq txt-42-1 "S"
  );setq
);if

(if (= txt-42 "Hastelloy C-276 (раб. штуцер), Hastelloy C-276 (диафр.)")
  (setq txt-42-1 "H"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-51 "Штуцер, наруж. резьба М20х1,5 DIN 16 288")
  (setq txt-51-1 "9"
        txt-51 "штуцер, наруж. резьба М20х1,5 DIN 16 288"
  );setq
);if

(if (= txt-51 "Штуцер, внутр. резьба 1/2 NPT")
  (setq txt-51-1 "4"
        txt-51 "штуцер, внутр. резьба 1/2 NPT"
  );setq
);if

(if (= txt-51 "Штуцер, наруж. резьба 1/2 NPT")
  (setq txt-51-1 "7"
        txt-51 "штуцер, наруж. резьба 1/2 NPT"
  );setq
);if

(if (= txt-51 "Штуцер, наруж. резьба G1/2 DIN 16 288")
  (setq txt-51-1 "8"
        txt-51 "штуцер, наруж. резьба G1/2 DIN 16 288"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-43 "1 отв., внутр. резьба G1/2")               
  (setq txt-43-1 "0"
  );setq
);if

(if (= txt-43 "2 отв., без заглушки, внутр. резьба 1/2 NPT")
  (setq txt-43-1 "2"
  );setq
);if

(if (= txt-43 "2 отв., без заглушки, внутр. резьба Pg 13,5")
  (setq txt-43-1 "3"
  );setq
);if

(if (= txt-43 "2 отв., без заглушки, внутр. резьба М20")
  (setq txt-43-1 "4"
  );setq
);if

(if (= txt-43 "2 отв., 1 заглушка, внутр. резьба G1/2")
  (setq txt-43-1 "5"
  );setq
);if

(if (= txt-43 "2 отв., 1 заглушка, внутр. резьба 1/2 NPT")
  (setq txt-43-1 "7"
  );setq
);if

(if (= txt-43 "2 отв., 1 заглушка, внутр. резьба Pg 13,5")
  (setq txt-43-1 "8"
  );setq
);if

(if (= txt-43 "2 отв., 1 заглушка, внутр. резьба М20")
  (setq txt-43-1 "9"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-41 "Отсутствует")                
  (setq txt-41-1 "N"
        txt-41 "отсутствует"
  );setq
);if

(if (= txt-41 "ЖК дисплей")
  (setq txt-41-1 "D"
  );setq
);if

(if (= txt-41 "ЖК дисплей с переключателем шкалы")
  (setq txt-41-1 "E"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-60 "Отсутствует")                
  (setq txt-60-1 "N"
        txt-60 "отсутствует"
  );setq
);if

(if (= txt-60 "SECC (углеродистая сталь)")
  (setq txt-60-1 "E"
  );setq
);if

(if (= txt-60 "SUS304")
  (setq txt-60-1 "F"
  );setq
);if

(setq txt-ins-1 (strcat "EJA530A-" txt-20-1 txt-11-1 txt-42-1 txt-51-1 "N-0" txt-43-1 txt-41-1 txt-60-1)
);setq

(101-empt-lin-spcf)

;отрисовка строк спецификации
(setvar "osmode" 6199)
(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	    x-pnt-ins (nth 0 pnt-ins)
	    y-pnt-ins (nth 1 pnt-ins)
	    ypnt-ins-1 y-pnt-ins
);setq

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(repeat 15
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins ypnt-ins-1))
  (setq ypnt-ins-1 (- ypnt-ins-1 8)
  );setq
);repeat

(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Датчик давления");наименование

(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 12)) 2.5 0 (strcat "- выходной сигнал    " txt-20))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 20)) 2.5 0 (strcat "- диапазон перенастройки верхнего предела шкалы (капсулы)    " txt-11 "МПа"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 28)) 2.5 0 (strcat "- материал частей    " txt-42))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 36)) 2.5 0 (strcat "- присоединение к процессу    " txt-51))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 44)) 2.5 0 (strcat "- электрический ввод    " txt-43))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 52)) 2.5 0 (strcat "- индикатор    " txt-41))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 60)) 2.5 0 (strcat "- монтажный кронштейн    " txt-60))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 68)) 2.5 0 (strcat "- измеряемая среда    " (strcase txt-10 1)))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 76)) 2.5 0 (strcat "- температура измеряемой среды    " txt-31 "..." txt-32 "%%dC"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 84)) 2.5 0 (strcat "- максимальное статическое давление измеряемой среды    " txt-33 "МПа"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 92)) 2.5 0 (strcat "- требуемая шкала    " txt-34 "..." txt-35 "МПа"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 100)) 2.5 0 (strcat "- погрешность    " txt-12 "%"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 108)) 2.5 0 "- государственная поверка")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 txt-ins-1);код заказа

(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество

(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "Yokogawa Electric CIS");производитель

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 4)) 2.5 0 "№14495-09 в Госреестре");сертификат
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 12)) 2.5 0 "средств измерений")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun list-filling
(name-list data-list / )

(progn
  (start_list name-list)
  (mapcar 'add_list data-list)
  (end_list)
);progn

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

