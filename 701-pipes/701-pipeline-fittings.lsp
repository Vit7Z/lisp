;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:701-pipeline-fittings

( / adoc dcl-id file-name file-open list-01 list-02 list-03 list-04 list-06 list-901 list-902 path-file-open str-01 type-list)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setq list-01 (list "30ч6бр")
      list-901 nil  
      list-902 nil                
      str-01 nil
      
      path-file-open nil
);setq

(txt-01-701-pipeline-fittings)

(if (< (setq dcl-id (load_dialog "dia-701-pipeline-fittings.dcl")) 0) ;ищем диалог
    (progn
      (alert "Не найден dcl-файл")
      (exit)
    );progn
);if

(if (not (new_dialog "dia_701_pipeline_fittings" dcl-id))
    (exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-06" list-06)

(set_tile "txt-01" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-06" "0")


(action_tile "txt-01"
  (strcat "(txt-01-701-pipeline-fittings)");srcat
);action_tile


(action_tile "txt-04"
  (strcat "(set_tile \"txt-06\" $value)");srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-701-pipeline-fittings)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le")
  (tmp-le-701-pipeline-fittings)
);if

(if (= type-list "spcf")
  (tmp-spcf-701-pipeline-fittings)
);if

(if (= type-list "lecgv")
  (tmp-lecgv-701-pipeline-fittings)
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;подпрогамма чтения данных из файлов//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-701-pipeline-fittings

( / file-name-data file-name-descr file-open path-file-open str-f str-lft-03 str-lft-04 str-lft-06)

(if (= str-01 nil)
  (setq str-01 "30ч6бр");setq
  (setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);setq

(cond
  ((= str-01 "30ч6бр") 
    (setq file-name-descr "701-pipeline-fittings-30ch6br-descr.txt"
          file-name-data "701-pipeline-fittings-30ch6br-data.txt"
    );setq
  );=
); cond

(setq list-02 nil);setq

(setq path-file-open (findfile file-name-descr);открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
      str-f 1
);setq

(while (/= str-f nil)
  (setq str-f (read-line file-open));setq
  (if (/= str-f nil) (setq list-02 (vl-list* str-f list-02)));if  
);while

(close file-open)

(setq list-02 (reverse (vl-remove "" list-02)));setq

(list-filling "txt-02" list-02)

(setq str-lft-03 nil
			str-lft-04 nil
      str-lft-06 nil
      str-f 1
      list-03 nil
      list-04 nil
      list-06 nil
);setq

(setq path-file-open (findfile file-name-data);открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
);setq

(while (/= str-f nil)
      (setq str-f (read-line file-open));setq
      
      (if (/= str-f nil)
				(setq str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
							str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
							str-lft-06 (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\		
						
							list-03 (vl-list* str-lft-03 list-03);создаем список из считанных строк из файла
							list-04 (vl-list* str-lft-04 list-04)
							list-06 (vl-list* str-lft-06 list-06)
				);setq
      );if
);while

(close file-open)

(setq list-03 (reverse (vl-remove "" list-03))
			list-04 (reverse (vl-remove "" list-04))
      list-06 (reverse (vl-remove "" list-06))
);setq

(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-06" list-06)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-701-pipeline-fittings

( / str-01 str-03 str-04 str-05 str-06 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01);считываем выбранные данные
      str-03 (nth (atoi (get_tile "txt-03")) list-03)
      str-04 (nth (atoi (get_tile "txt-04")) list-04)
      str-06 (nth (atoi (get_tile "txt-06")) list-06)
);setq

(if (= str-01 "30ч6бр")
  (progn
    (setq list-901 (vl-list* (strcat str-01 "  " str-03 "МПа  Ду " str-04 "мм") list-901));setq
    
    (setq tmp-list-902 (list (cons 1 str-01) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-06))
          list-902 (vl-list*  tmp-list-902 list-902)
    );setq
  );progn
);setq


(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-701-pipeline-fittings

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-tmp-1 (cdr (assoc 1 str-tmp))
        str-tmp-3 (cdr (assoc 3 str-tmp))
        str-tmp-4 (cdr (assoc 4 str-tmp))
        str-tmp-5 (cdr (assoc 5 str-tmp))
        str-tmp-99 (cdr (assoc 99 str-tmp))
  );setq
 
  (setvar "osmode" 6199)
  (setq pnt-ins   (getpoint "\nУкажите точку вставки\n")
        x-pnt-ins (nth 0 pnt-ins)
        y-pnt-ins (nth 1 pnt-ins)
        y-pnt-ins-1 y-pnt-ins
        dlt-y 8
  ); setq
  (101-empt-lin-spcf)
  (setvar "osmode" 0)
  (setvar "cmdecho" 0)

  ;обработка данных
  ;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-1 "30ч6бр")
    (progn    
      (setq nmbr-ln 3);setq

      (1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
      (setvar "osmode" 0)
      (setvar "cmdecho" 0)
       
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Задвижка чугунная, с параллельным затвором")
      (command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- давление " str-tmp-3 "кгс/см2, диаметр " str-tmp-4 "мм"))
      ;
      (command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "30ч6бр Ру " str-tmp-3 " Ду " str-tmp-4)) ;Тип, марка, обозначение документа, опросного листа
      ;(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ГОСТ 12820-80")
      ;
;      (command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "\"Schneider Electric\",")
;			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")      
      ;
      (command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
      ;
      (command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)
    );progn
  );if
  ;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    

  (repeat nmbr-ln
    (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
    (setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
  );repeat

  (setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-701-pipeline-fittings

( / cntr-1 dlt-y nmbr-ln pnt-ins right-bottom st-1 st-2 st-3 st-4 st-5 st-6 st-7 str-tmp str-tmp-0 str-tmp-1 str-tmp-10 str-tmp-2 str-tmp-21 str-tmp-22 str-tmp-3 str-tmp-4 
str-tmp-5 str-tmp-6 str-tmp-7 str-tmp-8 str-tmp-9 str-tmp-91 str-tmp-92 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-tmp-1 (cdr (assoc 1 str-tmp))
        str-tmp-2 (cdr (assoc 2 str-tmp))
        str-tmp-3 (cdr (assoc 3 str-tmp))
        str-tmp-4 (cdr (assoc 4 str-tmp))
        str-tmp-5 (cdr (assoc 5 str-tmp))
        str-tmp-6 (cdr (assoc 6 str-tmp))
        str-tmp-7 (cdr (assoc 7 str-tmp))
        str-tmp-8 (cdr (assoc 8 str-tmp))
        str-tmp-9 (cdr (assoc 9 str-tmp))
        str-tmp-10 (cdr (assoc 10 str-tmp))
  );setq



  (setvar "osmode" 6199)
  (setq pnt-ins   (getpoint "\nУкажите точку вставки\n")
        x-pnt-ins (nth 0 pnt-ins)
        y-pnt-ins (nth 1 pnt-ins)
        y-pnt-ins-1 y-pnt-ins
        dlt-y 8
  ); setq
  (09-empt-lin-le-cgv)
  (setvar "osmode" 0)
  (setvar "cmdecho" 0)

  ;обработка данных 
  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-1 "ЗК14-2-27-2009")
    (progn
      (cond
        ((= str-tmp-7 "16-200Л (ВНИЛ.491116.011-11) Ст.35") 
          (setq str-tmp-21 "16-200Л (ВНИЛ.491116.011-11)"
                str-tmp-22 "Ст.35-ЗК14-2-27-2009"
        )); =
        ((= str-tmp-7 "16-300Л (П3.2286-015-15) 12Х18Н9Т") 
          (setq str-tmp-21 "16-300Л (П3.2286-015-15)"
                str-tmp-22 "12Х18Н9Т-ЗК14-2-27-2009"
        )); =
        ((= str-tmp-7 "16-300Л (ВНИЛ.491116.011-27) 12Х18Н10Т") 
          (setq str-tmp-21 "16-300Л (ВНИЛ.491116.011-27)"
                str-tmp-22 "12Х18Н10Т-ЗК14-2-27-2009"
        )); =
      );cond
      
      (cond
        ((= str-tmp-9 "20х3, сталь Ст.35") 
          (setq str-tmp-91 "20х3"
                str-tmp-92 "сталь Ст.35"
        )); =
        ((= str-tmp-9 "12х2, сталь 12Х18Н9Т") 
          (setq str-tmp-91 "12х2"
                str-tmp-92 "сталь 12Х18Н9Т"
        )); =
        ((= str-tmp-9 "20х3, сталь 12Х18Н10Т") 
          (setq str-tmp-91 "20х3"
                str-tmp-92 "12Х18Н10Т"
        )); =
      );cond
      
      (setq nmbr-ln 8
      );setq
      
      (1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
      
      (setq right-bottom (+ (* nmbr-ln 8) 2) ;удаление предыдущих записей
            st-1 (ssget "_c" (list (- x-pnt-ins 9.5) (- y-pnt-ins 2)) (list (- x-pnt-ins 5.5) (- y-pnt-ins 6)));позиция
            st-2 (ssget "_c" (list (+ x-pnt-ins 10) (- y-pnt-ins 2)) (list (+ x-pnt-ins 2) (- y-pnt-ins right-bottom)));обозначение
            st-3 (ssget "_c" (list (+ x-pnt-ins 70) (- y-pnt-ins 2)) (list (+ x-pnt-ins 62) (- y-pnt-ins right-bottom)));наименование 
            st-4 (ssget "_c" (list (+ x-pnt-ins 132) (- y-pnt-ins 2)) (list (+ x-pnt-ins 128) (- y-pnt-ins 6)));число
            st-5 (ssget "_c" (list (+ x-pnt-ins 132) (- (- y-pnt-ins (* dlt-y 4)) 2)) (list (+ x-pnt-ins 128) (- (- y-pnt-ins (* dlt-y 4)) 6)));число комплектующая 1
            st-6 (ssget "_c" (list (+ x-pnt-ins 132) (- (- y-pnt-ins (* dlt-y 5)) 2)) (list (+ x-pnt-ins 128) (- (- y-pnt-ins (* dlt-y 5)) 6)));число комплектующая 2
            st-7 (ssget "_c" (list (+ x-pnt-ins 144.5) (- y-pnt-ins 2)) (list (+ x-pnt-ins 140.5) (- y-pnt-ins 6)));масса
      );setq
      
      (if (= st-1 nil) 
        (command "_text" "_MC" (list (- x-pnt-ins 7.5) (- y-pnt-ins 4)) 2.5 0 "****")
      );if
      (if (/= st-2 nil) (command "_erase" st-2 ""));if
      (if (/= st-3 nil) (command "_erase" st-3 ""));if
      (if (= st-4 nil) 
        (command "_text" "_MC" (list (+ x-pnt-ins 130) (- y-pnt-ins 4)) 2.5 0 "**")
      );if
      (if (/= st-5 nil) (command "_erase" st-5 ""));if
      (if (/= st-6 nil) (command "_erase" st-6 ""));if
      (if (/= st-7 nil) (command "_erase" st-7 ""));if
      
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-21)
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-22)
      
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Закладная конструкция отборного"))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "устройства давления с клапаном под"))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "приварку для подключения"))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "импульсной линии, составе:"))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- клапан " str-tmp-8))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- труба цельнотянутая " str-tmp-91 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat str-tmp-92 ", длина 100мм."))
      
      (command "_text" "_MC" (list (+ x-pnt-ins 130) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "1")
      (command "_text" "_MC" (list (+ x-pnt-ins 130) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "1")      
      
      (command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,4")
    );progn
  );if
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
    
  (repeat nmbr-ln
    (command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
    (setq y-pnt-ins-1 (- y-pnt-ins-1 8)
    );setq
  );repeat
    

  (setq cntr-1 (+ cntr-1 1)
  );setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





