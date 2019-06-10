create table blog(
    blog_idx number primary key, -- �ε���
    blog_name varchar2(20),      -- �̸�
    blog_id varchar2(20),        -- ���̵�
    blog_pw varchar2(20),        -- �н�����
    blog_email varchar2(40)      -- �̸����ּ�
);

create table board(
    board_idx number primary key,     -- �Խñ��� �ε���
    board_title varchar2(40),         -- �Խñ� ����
    board_content varchar2(400),      -- �Խñ� ����
    board_writer varchar2(20),        -- �Խñ� �ۼ���
    board_date date DEFAULT SYSDATE,  -- ���� ��¥
    board_cnt number                  -- ��ȸ��
);

create table quiz( --������ ����
    quiz_idx number primary key, -- �ε���
    quiz_question varchar2(100), -- ����
    quiz_answer varchar2(20),    -- ����
    quiz_btn1 varchar2(20),      -- ����1
    quiz_btn2 varchar2(20),      -- ����2
    quiz_btn3 varchar2(20),      -- ����3
    quiz_btn4 varchar2(20)       -- ����4
);

create table oxquiz(
    oxquiz_idx number primary key,  -- �ε���
    oxquiz_question varchar2(100),  -- ����
    oxquiz_answer varchar2(10)      -- ����
);

create table quizrank(
  rank_idx number primary key,        -- �ε���
  rank_user varchar2(40),             -- �������̵�
  rank_select_score number default 0, -- ���������� ����
  rank_ox_score number default 0      -- OX���� ����
);

create sequence seq_blog_idx increment by 1 start with 1;
create sequence seq_board_idx increment by 1 start with 1; 
create sequence seq_quiz_idx increment by 1 start with 1;
create sequence seq_rank_idx increment by 1 start with 1;
create sequence seq_oxquiz_idx increment by 1 start with 1;

insert into oxquiz values(seq_oxquiz_idx.nextval,'�ڸ���ī�� ������ ŷ�����̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�Ϻ��� ������ ����ī�̴�','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'������ ������ �������̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�縶�Ͼ��� ������ ������Ƽ�̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'��Ʈ���� ������ �ϳ����̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�ʸ����� ������ �����̴�','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�Ұ������� ������ ���Ǿ��̴�','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�߽����� ������ ĭ���̴�','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�������� ������ �����̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�±��� ������ �����̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'���þ��� ������ ī���̴�','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'������� ������ ����������̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'��������� ������ �����׶���̴�','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'����Ʈ�� ������ �ƽ����̴�','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�ݷҺ���� ������ ����Ÿ�̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�������� ������ �ĸ���','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'������ ������ �����̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'������� ������ �ż��̴�','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'�Ƹ���Ƽ���� ������ �ο��뽺���̷����̴�','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'���ѹα��� ������ �����̴�','X');


insert into quiz values(seq_quiz_idx.nextVal,'���ѹα��� ������?','����','�λ�','����','����','����');
insert into quiz values(seq_quiz_idx.nextVal,'������ ������?','������','����','������','�Ժθ�ũ','�븥');
insert into quiz values(seq_quiz_idx.nextVal,'������� ������?','��Ƽ��','���','��������','��Ƽ��','�ż�');
insert into quiz values(seq_quiz_idx.nextVal,'�縶�Ͼ��� ������?','������Ƽ','������Ƽ','���Һ�','Ƽ�̼�ƶ�','�̾ƽ�');
insert into quiz values(seq_quiz_idx.nextVal,'���þ��� ������?','��ũ��','ī��','��ũ��','���𺸽���','��Ʈ���׸�');
insert into quiz values(seq_quiz_idx.nextVal,'��Ʈ���� ������?','�ϳ���','ȣġ��','�ϳ���','�ٳ�','�Ŀ�');
insert into quiz values(seq_quiz_idx.nextVal,'������� ������?','���������','���������','���Ŀ��','�����콺','��ٵ���');
insert into quiz values(seq_quiz_idx.nextVal,'��������� ������?','�����׶��','���޵�����','�Ͻ�','�����','�����׶��');
insert into quiz values(seq_quiz_idx.nextVal,'�ε��� ������?','������','������','ĶĿŸ','þ����','������');
insert into quiz values(seq_quiz_idx.nextVal,'������ ������?','����','����','��ü����','�����۵�','�������');
insert into quiz values(seq_quiz_idx.nextVal,'����Ʈ�� ������?','ī�̷�','ī�̷�','��ҽ�','�ƽ���','����');
insert into quiz values(seq_quiz_idx.nextVal,'�ݷҺ���� ������?','����Ÿ','�޵���','����Ÿ','�ٶ�Ű��','��Ÿ����Ÿ');
insert into quiz values(seq_quiz_idx.nextVal,'�±��� ������?','����','ġ�Ӹ���','��Ÿ��','����Ÿ��','����');
insert into quiz values(seq_quiz_idx.nextVal,'�������� ������?','�ĸ�','�ĸ�','�Ͻ�','��������','����');
insert into quiz values(seq_quiz_idx.nextVal,'�ʸ����� ������?','���Ҷ�','����','���Ҷ�','���ο���','�ٹٿ�');
insert into quiz values(seq_quiz_idx.nextVal,'�������� ������?','����','����','�γ���','Ʋ����','����');
insert into quiz values(seq_quiz_idx.nextVal,'�Ϻ��� ������?','����','����ī','����','�����ī','������');
insert into quiz values(seq_quiz_idx.nextVal,'�߽����� ������?','�߽��ڽ�Ƽ','�߽��ڽ�Ƽ','���׷���','Ƽ�ľƳ�','ĭ��');
insert into quiz values(seq_quiz_idx.nextVal,'�Ұ������� ������?','���Ǿ�','�ٸ���','���Ǿ�','�θ�����','�缼');
insert into quiz values(seq_quiz_idx.nextVal,'�ڸ���ī�� ������?','ŷ����','��Ʈ���','ŷ����','�ױ׸�','���װ���');
