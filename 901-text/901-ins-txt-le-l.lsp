; ///////////////////////   вставка текста в пэ в графу наименование ////////////////////////////////////
(defun c:901-ins-txt-le-l 

( / dcl-id list-01 list-01-read-file pnt-ins st-1 str-01 xpnt-ins ypnt-ins)

(setvar	"osmode" 6199)
(setvar	"cmdecho" 0)

(read-file-for-dialog-box-01 "901-ins-txt-le-r.txt" 1)

(setq list-01 list-01-read-file);setq

(if (< (setq dcl-id (load_dialog "dia-901-ins-txt-le-r.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_901_ins_txt_le_r" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(set_tile "txt-01" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(setq str-01 (nth 0 list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq xpnt-ins (nth 0 pnt-ins)
		    ypnt-ins (nth 1 pnt-ins)
        pnt-ins (list (+ xpnt-ins 1) (+ ypnt-ins 4))
  );setq
  
  (setvar	"OSMODE" 0)
  
	(setq st-1 (ssget "_c" (list xpnt-ins (+ ypnt-ins 8)) (list (+ xpnt-ins 3) ypnt-ins) '((0 . "*text"))));setq

	(if (/= st-1 nil) (command "_erase" st-1 ""));if

	(setq st-1 nil);setq
 
  (command "_TEXT" "_ML" pnt-ins 2.5 0 str-01)
  
  (setvar	"OSMODE" 6199)
);while

(setvar	"cmdecho" 1)
(setvar	"OSMODE" 6199)

(princ)
)
; /////////////////////// конец программы /////////////////////////////////////////////////////////////
