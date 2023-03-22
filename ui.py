import tkinter as tk
from main import search_in_file

window=tk.Tk()

def on_button_click():
    check_book=check_box()
    word=input_entry.get()

    search_in_file(word,check_book,var3.get()) #단어 검색 함수 호출

def on_entry_return(event):
    on_button_click()

window.title("Bible Search")  #title
window.geometry("640x400+100+100") #창의 기본 크기와 창의 띄워지는 x, y 좌표
window.resizable(True, True) #창의 크기 조정 가능 여부 (상하, 좌우)

#검색어 입력창
input_entry = tk.Entry(window, width=30)
input_entry.pack()
#enter버튼도 검색확인 버튼과 동일한 역할
input_entry.bind('<Return>', on_entry_return)

#검색확인 버튼
input_button = tk.Button(window, text="검색", command=on_button_click) #버튼 클릭시 on_button_click 함수 실행
input_button.pack()

#체크박스
def check_box():
    check_book = []

    if var.get() == True:
        check_book.append("창")
        check_book.append("출")
        check_book.append("레")
        check_book.append("민")
        check_book.append("신")
        check_book.append("수")
        check_book.append("삿")
        check_book.append("룻")
        check_book.append("삼상")
        check_book.append("삼하")
        check_book.append("왕상")
        check_book.append("왕하")
        check_book.append("대상")
        check_book.append("대하")
        check_book.append("스")
        check_book.append("느")
        check_book.append("에")
        check_book.append("욥")
        check_book.append("시")
        check_book.append("잠")
        check_book.append("전")
        check_book.append("아")
        check_book.append("사")
        check_book.append("렘")
        check_book.append("애")
        check_book.append("겔")
        check_book.append("단")
        check_book.append("호")
        check_book.append("욜")
        check_book.append("암")
        check_book.append("옵")
        check_book.append("욘")
        check_book.append("미")
        check_book.append("나")
        check_book.append("합")
        check_book.append("습")
        check_book.append("학")
        check_book.append("슥")
        check_book.append("말")
    if var2.get() == True:
        check_book.append("마")
        check_book.append("막")
        check_book.append("눅")
        check_book.append("요")
        check_book.append("행")
        check_book.append("롬")
        check_book.append("고전")
        check_book.append("고후")
        check_book.append("갈")
        check_book.append("엡")
        check_book.append("빌")
        check_book.append("골")
        check_book.append("살전")
        check_book.append("살후")
        check_book.append("딤젼")
        check_book.append("딤후")
        check_book.append("딛")
        check_book.append("몬")
        check_book.append("히")
        check_book.append("약")
        check_book.append("벧전")
        check_book.append("벧후")
        check_book.append("요일")
        check_book.append("요이")
        check_book.append("요삼")
        check_book.append("유")
        check_book.append("계")
    return check_book

var = tk.BooleanVar()
var.set(True)
var2 = tk.BooleanVar()
var2.set(True)
chech_btn = tk.Checkbutton(text="구약",variable=var)
chech_btn.pack()
chech_btn2 = tk.Checkbutton(text="신약",variable=var2)
chech_btn2.pack()

#검색 스타일 선택 체크박스
var3 = tk.BooleanVar()
var.set(True)
chk_btn_style = tk.Checkbutton(text="정확한 검색 활성화", variable=var3)
chk_btn_style.pack()

window.mainloop()