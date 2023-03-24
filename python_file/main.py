
filename = ".\\Korean Standard Version of The Bible.txt" #성경 종류 선택에 따른 경로 지정 필요

#메인 검색 함수
def search_in_file(words, checkbook, style): #words - str
    global check_box #정확한 검색 활성화/비활성화(포괄적 검색)
    global exact_search

    check_box = checkbook #list
    search_complete = ""
    exact_search = style

    if words != "" and any(char.isdigit() for char in words) == False: #문자열에 숫자 포함시, 공백시 검색 안함
        words_list = is_words_list(words)

        with open(filename, "r", encoding="UTF-8") as file:
            print("검색어:", words_list)
            
            for line in file:
                words_in_line=choose_search_style(line)
                
                #list형식의 words_in_line일 경우
                if all(word in words_in_line for word in words_list):
                    search_complete = line
                    print(search_complete)

        if search_complete == "":
            print("검색 결과 없음", words)
            return "검색 결과를 찾을 수 없음"
        else:
            return search_complete
        
    else:
        print("공백이거나 숫자가 포함되어 있습니다.", words)
        return "공백"

# 검색어가 두 개 이상일 시, 각 단어를','를 기준으로 나눠서 리스트에 저장함. 한개면 그대로 리턴
def is_words_list(word):
    if "," in word:
        word_list = word.split(',')
        return word_list
    elif ' ' in word:
        word_list = word.split(" ")
        return word_list
    else:
        return [word]
    
#정확한 검색, 혹은 포괄적인 검색
def choose_search_style(line):

    if check_box_for_search(line):
        if exact_search == True: #정확한 검색 활성화(띄어쓰기로 구분된 단어가 완벽하게 일치해야 함. ex)'책'검색시 "책에"는 검색안됨) 
            words_in_line = line.split()[1:] #type list | 검색창에서는 장,절을 검색할 수 없게 함 ex) "하나님,계" 라고 검색하면 계시록에서만 하나님이 검색되는 문제가 있었는데, split하여 첫 문장을 검색하지 않게 만듬
            return words_in_line
        elif exact_search == False: #포괄적인 검색
            words_in_line = line.split()[1:] 
            words_in_line = " ".join(words_in_line) #type str | list에는 띄어쓰기로 구분하여 원소가 저장되는데, 이 때문에 각 원소와 완전히 같은 단어가 아니면 검색이 안되는 문제가 있음. join으로 단어들을 합치는 동시에 중간중간 띄어쓰기를 넣어줌
            return words_in_line
    else:
        return ""
    
#검색하고자 하는 권을 체크박스에 따라 지정함
def check_box_for_search(line):
    global check_box
    for select in check_box:
        if len(select) == 2:
            if any(select in line[:2] for select in check_box):
                return True
            else:
                return False
        elif len(select) == 1:
            if any(select in line[:1] for select in check_box):
                return True
            else:
                return False
        else:
            print("check_box_for_search 오류")
            return False

#def main():
#if __name__ == "__main__":
#    main()