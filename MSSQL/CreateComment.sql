CREATE TABLE comments (
	id INT NOT NULL IDENTITY(1,1),
	commenter INT NOT NULL,
	comment varchar(100) NOT NULL,
	created_at datetime NOT NULL DEFAULT GetDate()

	constraint commenter FOREIGN key (commenter) REFERENCES users(id) 
	ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE INDEX commenter_index on comments(commenter)

---���̺� �ڸ�Ʈ �ٴ¹�
---EXEC sp_updateextendedproperty 'MS_Description', '', 'user', dbo, 'table', 'commenter'

---EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'comments', '���' 
---���̺� �ڸ�Ʈ ����---
---EXEC sp_dropextendedproperty'MS_Description', '', 'user', dbo, 'table', '���'
