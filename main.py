filename = ".\\Korean Standard Version of The Bible.txt" #성경 종류 선택에 따른 경로 지정 필요

exact_search = 1 #정확한 검색 활성화

def is_words_list(word):
# 검색어가 두 개 이상일 시, 각 단어를','를 기준으로 나눠서 리스트에 저장함. 한개면 그대로 리턴
    if ',' in word:
        word_list = word.split(',')
        return word_list
    else:
        return [word]

def search_in_file(words, checkbook):
    global check_box
    check_box = checkbook
    search_complete = ""

    if words != "" and any(char.isdigit() for char in words) == False: #any는 하나라도 참이면 true를 반환함. 즉 words안에 하나라도 숫자가 있으면 true값이 반환됨. 문자열에 숫자 포함시, 공백시 검색 안함
        words_list = is_words_list(words)

        with open(filename, "r", encoding="UTF-8") as file:
            print("검색어:", words_list)
            
            for line in file:
                words_in_line=choose_search_style(line)
                 
                if all(word in words_in_line for word in words_list): # "word in line"와 "for word in words_list"로 나누어 해석해보자 "for word in words_list"는 words_list의 index 갯수만큼 작업을 반복한다는 것이다. 여기서 words_list의 index는 차례대로 word변수에 입력되고, words_list의 index 중 하나를 가진 word는 "word in line"을 통해 현재 검색중인 행에 word가 존재하는지 파악한다. all()함수는 words_list에 입력된 모든 index가 하나의 행 안에 속해있다고 판단될 때에만 true를 반환한다. 즉, word in line이 모두 true여야 한다는 것으로써 이렇게해서 입력된 모든 검색어가 속한 구절을 찾을 수 있는 것이다.
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

#정확한 검색, 혹은 포괄적인 검색
def choose_search_style(line):

    if check_box_for_search(line):
        if exact_search == True: #정확한 검색 활성화(띄어쓰기로 구분된 단어가 완벽하게 일치해야 함. ex)'책'검색시 "책에"는 검색안됨) 
            words_in_line = line.split()[1:] #검색창에서는 장,절을 검색할 수 없게 함 ex) "하나님,계" 라고 검색하면 계시록에서만 하나님이 검색되는 문제가 있었는데, split하여 첫 문장을 검색하지 않게 만듬
            return words_in_line
        else: #포괄적인 검색
            words_in_line = line.split()[1:] 
            words_in_line = " ".join(words_in_line) #list에는 띄어쓰기로 구분하여 원소가 저장되는데, 이 때문에 각 원소와 완전히 같은 단어가 아니면 검색이 안되는 문제가 있음. join으로 단어들을 합치는 동시에 중간중간 띄어쓰기를 넣어줌
            return words_in_line
    else:
        return ""
    
def check_box_for_search(line):
    global check_box
    select_box = check_box

    if any(select in line.split(" ")[0] for select in select_box):
        return True
    else:
        return False

#def main():


#if __name__ == "__main__":
#    main()