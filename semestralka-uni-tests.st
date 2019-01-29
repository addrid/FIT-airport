TestCase subclass: #UniTest	instanceVariableNames: 'departments subjects students'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni-tests'!!UniTest commentStamp: '<historical>' prior: 0!TestCASE to check the university implementation.

- When the TestCASE is selected, you may run its test by clicking the rightmost button in this window down right.
- First the setUp method is called to set up the testing environment.
- Then each method testXY is invoked to check if it is satisfied.
- You may  select and run each test separately -- setUp is called before each test.
- If your test fails, you may debug it (middle button) to see what went wrong.
- You may also send "object inspect" messages in your testing method to have a look inside an object. Inspector is then invoked when the test is run.!!UniTest methodsFor: 'initialize-release' stamp: 'IvanRyant 9/13/2013 14:44'!setUp
	"This method is called by the SUnit framework during the initialization of a TestCase"
	
	self
		setUpDB;
		setUpDepartment1;
		setUpDepartment2;
		setUpEmptyDepartment;
		setUpDepartmentWithNonTeachingTeacher;
		setUpDepartment3AndStudent1;
		setUpDepartment4;
		setUpStudent2! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/8/2013 21:50'!testDepartmentResearchRelators
	"Test department researchRelatorsCol multipliticty check. Both positive and negative tests must pass!!:"
	
	| dept res |
	dept := departments detect: [:d | d code = 'DSA'].
	res := (dept staffSet detect: [:p | p name = 'Bob Hurricane']) researcherRolesCol first.
	self assert: res checkResearchRelatorsColMult.
	dept := departments detect: [:d | d code = 'LSA'].
	res := (dept staffSet detect: [:p | p name = 'Pat Patashone']) researcherRolesCol first.
	self deny: res checkResearchRelatorsColMult! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 9/13/2013 14:44'!testDepartmentStaffMult
	"Test department staff multipliticty check. Both positive and negative tests must pass!!:"
	
	| dept |
	dept := departments detect: [:d | d code = 'DOP'].
	self assert: dept checkStaffMult.
	dept := departments detect: [:d | d code = 'ED'].
	self deny: dept checkStaffMult! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/8/2013 21:44'!testQueryDepartmentResearchGroupMemberships
	"Test research group and its memberships where Bob Hurricane is a member"
	
	| dept res group members |
	dept := departments detect: [:d | d code = 'DSA'].
	res := (dept staffSet detect: [:p | p name = 'Bob Hurricane']) researcherRolesCol first.	"first and the only research role"
	group := res participatesInSet detect: [:each | each name = 'Weak Behavioral Ornitology Group'].
	self assert: group name = 'Weak Behavioral Ornitology Group'.
	members := group membershipsCol.
	self assert: (members collect: [:each | each name]) asSortedCollection = #('Bob Hurricane' 'Sitting Bull') asSortedCollection! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 9/13/2013 14:44'!testQueryGuaranteedSubjects
	"select the subjects that DOP guarantees"
	
	| subjs dept subsCodes |
	dept := departments detect: [:d | d code = 'DOP'].
	subjs := dept guaranteedSubjectsSet: subjects.
	subsCodes := subjs collect: [:s | s code].
	self assert: subsCodes asSortedCollection = #('AOM' 'OMO') asSortedCollection	"We use sorted collection to match the order of listed codes, or else the test may fail on this."! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/8/2013 21:51'!testQueryStudentResearchGroupMemberships
	"Test research group and its memberships where Bob Hurricane is a member"
	
	| group members |
	group := (students detect: [:p | p name = 'Sitting Bull']) participatesInSet detect: [:each | each name = 'Weak Behavioral Ornitology Group'].
	self assert: group name = 'Weak Behavioral Ornitology Group'.
	members := group membershipsCol.
	self assert: (members collect: [:each | each name]) asSortedCollection = #('Bob Hurricane' 'Sitting Bull') asSortedCollection! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/8/2013 21:52'!testQueryStudentStudies
	"select the set of subjects that Pontiac studies"
	
	| s1 |
	s1 := students detect: [:s | s name = 'Pontiac Obwandiyag'].
	self assert: (s1 phase studiesSet collect: [:each | each code]) asSortedCollection = #('CLO' 'OMO') asSortedCollection	"must be sorted to equal correctly"! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 9/13/2013 14:44'!testQueryTaughtSubjects
	"select the subjects that DOP teaches"
	
	| subjs dept subsCodes |
	dept := departments detect: [:d | d code = 'DOP'].
	subjs := dept taughtSubjectsSet.
	subsCodes := subjs collect: [:s | s code].
	self assert: subsCodes asSortedCollection = #('OMO') asSortedCollection	"We use sorted collection to match the order of listed codes, or else the test may fail on this."! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 9/13/2013 14:44'!testRuleJustOneHead
	"Check whether the department has just one head"
	
	| dept |
	dept := departments detect: [:d | d code = 'LSA'].
	self assert: (dept staffSet select: [:p | p headOfDepartment]) size = 1.
	dept := departments detect: [:d | d code = 'DSA'].
	self deny: (dept staffSet select: [:p | p headOfDepartment]) size = 1! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/16/2013 23:51'!testRuleStaffOver18
	"Check whether the staff of a department is all over 18"
	
	| dept |
	dept := departments detect: [:d | d code = 'LSA'].
	self
		assert:
			(dept staffSet
				allSatisfy:
					[:p | 
					Date today
						>=
							(Date
								newDay: p dateOfBirth dayOfMonth
								month: p dateOfBirth monthIndex
								year: p dateOfBirth year + 18)]).
	dept := departments detect: [:d | d code = 'DSA'].
	self
		deny:
			(dept staffSet
				allSatisfy:
					[:p | 
					Date today
						>=
							(Date
								newDay: p dateOfBirth dayOfMonth
								month: p dateOfBirth monthIndex
								year: p dateOfBirth year + 18)])! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/8/2013 21:53'!testSalaryPolymorphism
	"It is here just for demonstration of polymorphism (aka points semestral project points :-). Again, both positive and negative tests."
	
	| dept1 dept2 teacher rr toBePayedCol teacherSalary researcherSalary |
	dept1 := departments detect: [:d | d code = 'DOP'].
	teacher := dept1 staffSet detect: [:p | p name = 'Alan Key'].	"Alan Key teaches one subject in our setup, so he should be fine."
	Date today year - teacher startDate year.
	teacherSalary := teacher salary.
	dept2 := departments detect: [:d | d code = 'DSA'].
	rr := (dept2 staffSet detect: [:p | p name = 'Bob Hurricane']) researcherRolesCol first.
	researcherSalary := rr salary.
	toBePayedCol := Set with: teacher with: rr.	"Collection with polymorphic objects understanding #salary"
	self
		assert:
			(toBePayedCol
				inject: 0
				into: [:sum :each | sum + each salary]) = (teacherSalary + researcherSalary).	"Salary sum as an example of polymorphic behaviour. BE CAREFUL ABOUT THE BRACKETS!!!!!!"
	self
		deny:
			(toBePayedCol
				inject: 0
				into: [:sum :each | sum + each salary]) = (teacherSalary + researcherSalary + 1)! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/8/2013 21:53'!testSalaryProfessor
	"Test professor's salary computation: this test actually does the same as the corresponding method, however in Test-Driven Development this would be written BEFORE the method as specification what it should do.  Test both positive and negative cases."
	
	| dept teacher years |
	dept := departments detect: [:d | d code = 'DOP'].
	teacher := dept staffSet detect: [:p | p name = 'Alan Key'].	"Alan Key teaches one subject in our setup, so he should be fine."
	years := Date today year - teacher startDate year.
	self assert: teacher salary = (teacher class fixRate + (years * teacher class bonusPerYear)).
	self deny: teacher salary = (teacher class fixRate + (years * teacher class bonusPerYear) + 1)	"BE CAREFUL ABOUT THE BRACKETS!!"! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/8/2013 21:54'!testSalaryResearcherRole
	"Test salary of the ResearcherRole. Both positive and negative case!!"
	
	| dept rr |
	dept := departments detect: [:d | d code = 'DSA'].
	rr := (dept staffSet detect: [:p | p name = 'Bob Hurricane']) researcherRolesCol first.
	rr researchPoints: 200.
	self assert: rr salary = (200 * rr class moneyPerResearchPoint).
	self deny: rr salary = (201 * rr class moneyPerResearchPoint)! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 9/13/2013 14:44'!testStudentPhase
	"Test student phase multiplicity. Both positive and negative tests must pass!!:"
	
	| s1 |
	s1 := students detect: [:s | s name = 'Sitting Bull'].
	self assert: s1 phase notNil.
	self deny: s1 phase isNil! !!UniTest methodsFor: 'running' stamp: 'IvanRyant 10/8/2013 21:54'!testTeacherRoleTeachingMult
	"Test  teacher's role multiplicity of teaching Both positive and negative tests must pass!!:"
	
	| dept teacher |
	dept := departments detect: [:d | d code = 'DOP'].
	teacher := dept staffSet detect: [:p | p name = 'Alan Key'].	"Alan Key teaches one subject in our setup, so he should be fine."
	self assert: teacher checkTeachingMult.
	dept := departments detect: [:d | d code = 'DOL'].
	teacher := dept staffSet detect: [:p | p name = 'John Procrastinator'].	"Procrastinator does not teach any subject."
	self deny: teacher checkTeachingMult! !!UniTest methodsFor: 'private' stamp: 'IvanRyant 10/7/2013 13:58'!setUpDB
	"initialize local database instance variables"
	
	departments := Set new.
	subjects := Set new.
	students := Set new! !!UniTest methodsFor: 'private' stamp: 'IvanRyant 10/8/2013 22:09'!setUpDepartment1
	
	| dept prof sgRole subject tRole relator |
	dept := (Department new)
		code: 'DOP';
		name: 'Department of Object Paradigm';
		yourself.
	departments add: dept.
	prof := (ProfessorRole person: (Person new))
		name: 'Alan Key';
		headOfDepartment: true;
		startDate: (Date newDay: 15 month: 4 year: 2000);
		yourself.
	dept staffSet add: prof.
	sgRole := SubjectGuarantorRole new.
	tRole := TeacherRole new.
	(prof subrolesCol)
		add: sgRole;
		add: tRole.
	subject := (Subject guarantor: sgRole)
		code: 'OMO';
		name: 'Object Modelling';
		credits: 4;
		yourself.
	subjects add: subject.
	relator := TeachingRelator subject: subject.
	tRole teachingRelatorsCol add: relator.
	sgRole := SubjectGuarantorRole new.
	prof subrolesCol add: sgRole.
	subject := (Subject guarantor: sgRole)
		code: 'AOM';
		name: 'Advanced Object Modelling';
		credits: 6;
		yourself.
	subjects add: subject! !!UniTest methodsFor: 'private' stamp: 'IvanRyant 10/8/2013 21:45'!setUpDepartment2
	
	| dept prof role subject |
	dept := (Department new)
		code: 'DFP';
		name: 'Department of Functional Paradigm';
		yourself.
	departments add: dept.
	prof := (ProfessorRole person: (Person new))
		name: 'Alonso Church';
		headOfDepartment: true;
		yourself.
	dept staffSet add: prof.
	role := SubjectGuarantorRole new.
	prof subrolesCol add: role.
	subject := (Subject guarantor: role)
		code: 'CLO';
		name: 'Clojure Programming Language';
		credits: 4;
		yourself.
	subjects add: subject! !!UniTest methodsFor: 'private' stamp: 'IvanRyant 10/16/2013 23:43'!setUpDepartment3AndStudent1
	
	| dept prof role group student |
	dept := (Department new)
		code: 'DSA';
		name: 'Department of Strange Affairs';
		yourself.
	departments add: dept.
	prof := (ProfessorRole person: (Person new))
		name: 'Bob Hurricane';
		headOfDepartment: false;
		dateOfBirth: Date today;
		yourself.	"this dept. has no head"	"this member of dept. is not 18 years old"
	dept staffSet add: prof.
	role := ResearcherRole new.
	prof subrolesCol add: role.
	group := (ResearchGroup new)
		name: 'Wild West Control Group';
		yourself.
	role add: prof to: group.
	group := (ResearchGroup new)
		name: 'Weak Behavioral Ornitology Group';
		yourself.
	role add: prof to: group.
	student := (StudentRole person: (Person new))
		name: 'Sitting Bull';
		yourself.
	students add: student.
	student addTo: group! !!UniTest methodsFor: 'private' stamp: 'IvanRyant 10/16/2013 23:43'!setUpDepartment4
	
	| dept prof role |
	dept := (Department new)
		code: 'LSA';
		name: 'Lingerie of Strange Affairs';
		yourself.
	departments add: dept.
	prof := (ProfessorRole person: (Person new))
		name: 'Pat Patashone';
		headOfDepartment: true;
		dateOfBirth: (Date newDay: 7 month: 7 year: 1990);
		yourself.
	dept staffSet add: prof.
	role := ResearcherRole new.
	prof subrolesCol add: role! !!UniTest methodsFor: 'private' stamp: 'IvanRyant 10/8/2013 21:47'!setUpDepartmentWithNonTeachingTeacher
	
	| dept prof |
	dept := (Department new)
		code: 'DOL';
		name: 'Department of Laziness';
		yourself.
	departments add: dept.
	prof := (ProfessorRole person: (Person new))
		name: 'John Procrastinator';
		headOfDepartment: false;
		yourself.
	dept staffSet add: prof! !!UniTest methodsFor: 'private' stamp: 'IvanRyant 9/13/2013 14:44'!setUpEmptyDepartment
	
	| dept |
	dept := (Department new)
		code: 'ED';
		name: 'Empty Department';
		yourself.
	departments add: dept! !!UniTest methodsFor: 'private' stamp: 'IvanRyant 10/8/2013 21:47'!setUpStudent2
	
	| student subj reg1 reg2 asp |
	subj := subjects detect: [:each | each code = 'OMO'].
	reg1 := SubjectRegistration subject: subj.
	subj := subjects detect: [:each | each code = 'CLO'].
	reg2 := SubjectRegistration subject: subj.
	asp := ActiveStudentPhase new.
	(asp registeredSubjectsCol)
		add: reg1;
		add: reg2.
	student := (StudentRole person: (Person new))
		name: 'Pontiac Obwandiyag';
		phase: asp;
		yourself.
	students add: student! !