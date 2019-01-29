Object subclass: #StudentRole	instanceVariableNames: 'phase person researchRelatorsCol'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!StudentRole commentStamp: '<historical>' prior: 0!StudentRole.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	phase	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of phase
	researchRelatorsCol	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of researchRelatorsCol

Constraints:

The phase attribute is lazy-initialized to SuspendedStudentPhase in order to ensure XOR constraint and the multiplicity of 1.
ResearchRelatorsCol must be checked softly for multiplicity 1..* using the checkResearchRelatorsColMult method.
!!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:20'!name
	^self person name! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:23'!name: anObject	self person name: anObject! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:24'!nameWithTitles		^self person nameWithTitles! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:21'!person	^person! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!phase
	
	^phase ifNil: [phase := SuspendedStudentPhase new]! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!phase: anObject
	
	phase := anObject! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:25'!titlesAfter	^self person titlesAfter! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:26'!titlesAfter: anObject	self person titlesAfter: anObject! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:27'!titlesBefore	^self person titlesBefore! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:27'!titlesBefore: anObject	self person titlesBefore: anObject! !!StudentRole methodsFor: 'testing' stamp: 'IvanRyant 9/13/2013 14:41'!checkResearchRelatorsColMult
	"Checking of researchRelatorsCol multiplicity constraint 1..*"
	
	^self researchRelatorsCol size >= 1! !!StudentRole methodsFor: 'methods' stamp: 'IvanRyant 9/13/2013 14:41'!addTo: aResearchGroup
	"Adds this student in aResearchGroup: aResearchGroup adds to the researchRelatorsCol and self to aResearchGroup membership.  Returns the new relator."
	
	| relator |
	relator := StudentsResearchMembershipRelator researchGroup: aResearchGroup.
	self researchRelatorsCol add: relator.
	aResearchGroup membershipsSet add: self.
	^relator! !!StudentRole methodsFor: 'methods' stamp: 'IvanRyant 9/13/2013 14:41'!participatesInSet
	"returns set of research groups, where the student participates"
	
	^(self researchRelatorsCol collect: [:each | each researchGroup]) asSet! !!StudentRole methodsFor: 'methods' stamp: 'IvanRyant 9/13/2013 14:41'!removeFrom: aResearchGroup
	"Removes this student from a research group. Returns the old relator."
	
	| relator |
	relator := self researchRelatorsCol detect: [:each | each researchGroup == aResearchGroup].
	self researchRelatorsCol remove: relator.
	aResearchGroup membershipsSet remove: self.
	^relator! !!StudentRole methodsFor: 'private' stamp: 'IvanRyant 9/13/2013 14:41'!researchRelatorsCol
	"This is accessor with lazy initialization of the collection.
	ATTENTION: This method is intended to be used for accessing the collection members only. The researchRelatorsCol collection is a contradirectional replica of membershipsSet. Do neither add nor remove entries in this collection without proper replication!!"
	
	^researchRelatorsCol ifNil: [researchRelatorsCol := OrderedCollection new]! !!StudentRole methodsFor: 'as yet unclassified' stamp: 'IvanRyant 10/8/2013 21:36'!initialize: aPerson		super initialize.	person := aPerson.	^self! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!StudentRole class	instanceVariableNames: ''!!StudentRole class methodsFor: 'instance creation' stamp: 'IvanRyant 10/7/2013 15:42'!new
	"Answer a newly created and initialized instance."
	
	^self shouldNotImplement! !!StudentRole class methodsFor: 'instance creation' stamp: 'IvanRyant 10/8/2013 22:18'!person: aPerson		^(super new)		initialize: aPerson;		yourself! !Object subclass: #SuspendedStudentPhase	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!SuspendedStudentPhase commentStamp: '<historical>' prior: 0!SuspendedStudentPhase.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Constraints: None
!"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!SuspendedStudentPhase class	instanceVariableNames: ''!!SuspendedStudentPhase class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^super new initialize! !Object subclass: #TeacherRole	instanceVariableNames: 'teachingRelatorsCol'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!TeacherRole commentStamp: '<historical>' prior: 0!TeacherRole.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	teachingRelatorsCol	<(Collection of: (AD2ClassModel | AD2DiagramSpec | AD2GeneralPreferencesDialog | AD2Images | AD2PainterPreferencesDialog | AD2PrinterPreferencesDialog | AragonTreeNode | BufferedValueHolder | DaskalosAbstractSymbol | DaskalosBrowser | DragHandle | PluggableAdaptor | ProtocolAdaptor | RangeAdaptor | RFC822Message | RuntimeBuilderEditor | StorePublishAnnouncement | StoreWorkActivity | SubjectRegistration | TeachingRelator))>	description of teachingRelatorsCol

Constraints:

Multiplicity of the teachingRelators association must be checked -- it is required to be at least 1.
!!TeacherRole methodsFor: 'testing' stamp: 'IvanRyant 9/13/2013 14:41'!checkTeachingMult
	
	^self teachingRelatorsCol size >= 1! !!TeacherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!teachesSet
	
	^(self teachingRelatorsCol collect: [:each | each subject]) asSet! !!TeacherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!teachingRelatorsCol
	
	^teachingRelatorsCol ifNil: [teachingRelatorsCol := OrderedCollection new]! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!TeacherRole class	instanceVariableNames: ''!!TeacherRole class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."

	^super new initialize! !Object subclass: #SubjectRegistration	instanceVariableNames: 'registered subject'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!SubjectRegistration commentStamp: '<historical>' prior: 0!SubjectRegistration.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	registered	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of registered
	subject	<GbxAbstractProxy | LensAbsentee | Object | ProtoObject | RemoteObject>	description of subject

Constraints:

	subject multiplicity is ensured by the class instance creation method subject: while disabling new at the same time.
!!SubjectRegistration methodsFor: 'initialize-release' stamp: 'IvanRyant 10/7/2013 15:55'!initialize
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	registered := TimeStamp now.
	^self! !!SubjectRegistration methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!registered
	
	^registered! !!SubjectRegistration methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!registered: anObject
	
	registered := anObject! !!SubjectRegistration methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!subject
	
	^subject! !!SubjectRegistration methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!subject: anObject
	
	subject := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!SubjectRegistration class	instanceVariableNames: ''!!SubjectRegistration class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	
	^self shouldNotImplement! !!SubjectRegistration class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!subject: aSubject
	
	^(super new)
		subject: aSubject;
		initialize;
		yourself	"sets timestamp to the current date-time"! !Object subclass: #Department	instanceVariableNames: 'name code staffSet'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!Department commentStamp: '<historical>' prior: 0!Department.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	code	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of code
	name	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of name
	staffCol	<Set>	description of staffCol

Constraints:

Multiplicity of the staff association must be checked -- it is required to be at least 1.
!!Department methodsFor: 'testing' stamp: 'IvanRyant 9/13/2013 14:41'!checkStaffMult
	"Checking of staff multiplicity constraint 1..*"
	
	^self staffSet size >= 1! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!code

	^code! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!code: anObject

	code := anObject! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!guaranteedSubjectsSet: allSubjectsSet
	"collect all the subjects that the members of this department guarantee"
	
	| roles |
	roles := self staffSet flatCollect: [:professor | professor subjectGuarantorRolesCol].
	^(allSubjectsSet select: [:each | roles includes: each guarantor]) asSet! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name

	^name! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name: anObject

	name := anObject! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!staffSet
	
	^staffSet ifNil: [staffSet := Set new]! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!taughtSubjectsSet
	"collect all the subjects that the teachers of this department teach"
	
	^(self staffSet flatCollect: [:professor | professor teacherRolesCol flatCollect: [:teacherRole | teacherRole teachesSet]]) asSet! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Department class	instanceVariableNames: ''!!Department class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."

	^super new initialize! !Object subclass: #ResearchMembershipRelator	instanceVariableNames: 'startDate researchGroup'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!ResearchMembershipRelator commentStamp: '<historical>' prior: 0!ResearchMembershipRelator.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	researchGroup	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of researchGroup
	startDate	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of startDate

Constraints:

		researchGroup multiplicity is ensured by the class instance creation method researchGroup: while disabling new at the same time.
!!ResearchMembershipRelator methodsFor: 'initialize-release' stamp: 'IvanRyant 9/13/2013 14:41'!initialize
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	startDate := Date today.
	^self! !!ResearchMembershipRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!researchGroup
	
	^researchGroup! !!ResearchMembershipRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!researchGroup: anObject
	
	researchGroup := anObject! !!ResearchMembershipRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate
	
	^startDate! !!ResearchMembershipRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate: anObject
	
	startDate := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ResearchMembershipRelator class	instanceVariableNames: ''!!ResearchMembershipRelator class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	
	^self shouldNotImplement! !!ResearchMembershipRelator class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!researchGroup: aResearchGroup
	
	^(super new)
		researchGroup: aResearchGroup;
		initialize;
		yourself! !ResearchMembershipRelator subclass: #StudentsResearchMembershipRelator	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!StudentsResearchMembershipRelator commentStamp: '<historical>' prior: 0!StudentsResearchMembershipRelator.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Constraints: None
!Object subclass: #Subject	instanceVariableNames: 'name code credits guarantor'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!Subject commentStamp: '<historical>' prior: 0!Subject.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	guarantor multiplicity is ensured by the class instance creation method guarantor: while disabling new at the same time.

!!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!code

	^code! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!code: anObject

	code := anObject! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!credits

	^credits! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!credits: anObject

	credits := anObject! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!guarantor
	
	^guarantor! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!guarantor: anObject
	
	guarantor := anObject! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name

	^name! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name: anObject

	name := anObject! !!Subject methodsFor: 'printing' stamp: 'IvanRyant 9/13/2013 14:41'!printString
	"String representation in the Inspector and Debugger"
	
	^self code isNil
		ifTrue: ['']
		ifFalse: [self code]! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Subject class	instanceVariableNames: ''!!Subject class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!guarantor: aSubjectGuarantorRole
	
	^(super new)
		guarantor: aSubjectGuarantorRole;
		initialize;
		yourself! !!Subject class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	
	^self shouldNotImplement! !Object subclass: #TeachingRelator	instanceVariableNames: 'room time subject'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!TeachingRelator commentStamp: '<historical>' prior: 0!TeachingRelator.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	room	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of room
	subject	<GbxAbstractProxy | LensAbsentee | Object | ProtoObject | RemoteObject>	description of subject
	time	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of time

Constraints:

	subject multiplicity is ensured by the class instance creation method subject: while disabling new at the same time.
!!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!room

	^room! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!room: anObject

	room := anObject! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!subject

	^subject! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!subject: anObject

	subject := anObject! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!time

	^time! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!time: anObject

	time := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!TeachingRelator class	instanceVariableNames: ''!!TeachingRelator class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^self shouldNotImplement! !!TeachingRelator class methodsFor: 'instance creation' stamp: 'IvanRyant 10/7/2013 15:41'!subject: aSubject
	
	^(super new)
		initialize;
		subject: aSubject;
		yourself! !Object subclass: #ActiveStudentPhase	instanceVariableNames: 'registeredSubjectsCol'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!ActiveStudentPhase commentStamp: '<historical>' prior: 0!ActiveStudentPhase.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	registeredSubjectsCol	<(Collection of: (AD2ClassModel | AD2DiagramSpec | AD2GeneralPreferencesDialog | AD2Images | AD2PainterPreferencesDialog | AD2PrinterPreferencesDialog | AragonTreeNode | BufferedValueHolder | DaskalosAbstractSymbol | DaskalosBrowser | DragHandle | PluggableAdaptor | ProtocolAdaptor | RangeAdaptor | RFC822Message | RuntimeBuilderEditor | StorePublishAnnouncement | StoreWorkActivity | SubjectRegistration | TeachingRelator))>	description of registeredSubjectsCol

*Constraints:*

Multiplicity of /registeredSubjects/ is ensured by implementation. No special check is needed.
!!ActiveStudentPhase methodsFor: 'methods' stamp: 'IvanRyant 9/13/2013 14:41'!studiesSet
	"collects all subjects that are bound to the active student by the registeredSubjects association"
	
	^(self registeredSubjectsCol collect: [:each | each subject]) asSet! !!ActiveStudentPhase methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!registeredSubjectsCol
	
	^registeredSubjectsCol ifNil: [registeredSubjectsCol := OrderedCollection new]! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ActiveStudentPhase class	instanceVariableNames: ''!!ActiveStudentPhase class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^super new initialize! !Object subclass: #ResearcherRole	instanceVariableNames: 'researchRelatorsCol researchPoints roleName'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!ResearcherRole commentStamp: '<historical>' prior: 0!ResearcherRole.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	researchRelatorsCol	<(Collection of: ResearchMembershipRelator)>	description of researchRelatorsCol

Constraints:

ResearchRelatorsCol must be checked softly for multiplicity 1..* using the checkResearchRelatorsColMult method.
!!ResearcherRole methodsFor: 'private' stamp: 'IvanRyant 9/13/2013 14:41'!researchRelatorsCol
	"This is accessor with lazy initialization of the collection.
	ATTENTION: This method is intended to be used for accessing the collection members only. The researchRelatorsCol collection is a contradirectional replica of membershipsSet. Do neither add nor remove entries in this collection without proper replication!!"
	
	^researchRelatorsCol ifNil: [researchRelatorsCol := OrderedCollection new]! !!ResearcherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!researchPoints
	
	^researchPoints ifNil: [researchPoints := 0]! !!ResearcherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!researchPoints: anObject
	
	researchPoints := anObject! !!ResearcherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!roleName
	
	^roleName! !!ResearcherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!roleName: anObject
	
	roleName := anObject! !!ResearcherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!salary
	
	^self researchPoints * self class moneyPerResearchPoint! !!ResearcherRole methodsFor: 'testing' stamp: 'IvanRyant 9/13/2013 14:41'!checkResearchRelatorsColMult
	"Checking of researchRelatorsCol multiplicity constraint 1..*"
	
	^self researchRelatorsCol size >= 1! !!ResearcherRole methodsFor: 'methods' stamp: 'IvanRyant 9/13/2013 14:41'!add: aProfessor to: aResearchGroup
	"Adds a professor to a research group. Returns the new relator."
	
	| relator |
	relator := ProfessorsResearchMembershipRelator researchGroup: aResearchGroup.
	self researchRelatorsCol add: relator.
	aResearchGroup membershipsSet add: aProfessor.
	^relator! !!ResearcherRole methodsFor: 'methods' stamp: 'IvanRyant 9/13/2013 14:41'!participatesInSet
	"returns set of research groups, where the professor participates"
	
	^(self researchRelatorsCol collect: [:each | each researchGroup]) asSet! !!ResearcherRole methodsFor: 'methods' stamp: 'IvanRyant 9/13/2013 14:41'!remove: aProfessor from: aResearchGroup
	"Removes a professor from a research group. Returns the old relator."
	
	| relator |
	relator := self researchRelatorsCol detect: [:each | each researchGroup == aResearchGroup].
	self researchRelatorsCol remove: relator.
	aResearchGroup membershipsSet remove: aProfessor.
	^relator! !!ResearcherRole methodsFor: 'querying' stamp: 'IvanRyant 9/13/2013 14:41'!morePointsThan: aResearcherRole
	
	^self researchPoints > aResearcherRole researchPoints! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ResearcherRole class	instanceVariableNames: ''!!ResearcherRole class methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!moneyPerResearchPoint
	
	^300! !!ResearcherRole class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^super new initialize! !Object subclass: #ProfessorRole	instanceVariableNames: 'headOfDepartment startDate person subrolesCol'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!ProfessorRole commentStamp: '<historical>' prior: 0!ProfessorRole.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	headOfDepartment	<Boolean>	description of headOfDepartment
	startDate	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of dateOfBirth

Constraints:

None.
!!ProfessorRole methodsFor: 'private' stamp: 'IvanRyant 9/13/2013 14:41'!person
	^person! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/16/2013 23:45'!dateOfBirth	^self person dateOfBirth! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/16/2013 23:47'!dateOfBirth: anObject	self person dateOfBirth: anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!headOfDepartment

	^headOfDepartment ifNil: [headOfDepartment := false]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!headOfDepartment: anObject

	headOfDepartment := anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name

	^self person name! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name: anObject

	self person name: anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:12'!nameWithTitles
	
	^self person nameWithTitles! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:08'!researcherRolesCol
	
	^self subrolesCol select: [:r | r isKindOf: ResearcherRole]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!salary
	
	| years |
	years := Date today year - self startDate year.
	^self class fixRate + (years * self class bonusPerYear)! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate
	
	^startDate! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate: anObject
	
	startDate := anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:08'!subjectGuarantorRolesCol
	
	^self subrolesCol select: [:r | r isKindOf: SubjectGuarantorRole]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:07'!subrolesCol
	
	^subrolesCol ifNil: [subrolesCol := OrderedCollection new]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:07'!teacherRolesCol
	
	^self subrolesCol select: [:r | r isKindOf: TeacherRole]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesAfter

	^self person titlesAfter! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesAfter: anObject

	self person titlesAfter: anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesBefore

	^self person titlesBefore! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesBefore: anObject

	self person titlesBefore: anObject! !!ProfessorRole methodsFor: 'testing' stamp: 'IvanRyant 10/7/2013 15:10'!checkTeachingMult
	
	^self teacherRolesCol size >= 1! !!ProfessorRole methodsFor: 'initialize-release' stamp: 'IvanRyant 10/8/2013 21:34'!initialize: aPerson
	
	super initialize.	person := aPerson.
	startDate := Date today.
	^self! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ProfessorRole class	instanceVariableNames: ''!!ProfessorRole class methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!bonusPerYear
	
	^2000! !!ProfessorRole class methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!fixRate
	
	^14000! !!ProfessorRole class methodsFor: 'instance creation' stamp: 'IvanRyant 10/7/2013 15:42'!new
	"Answer a newly created and initialized instance."

	^self shouldNotImplement! !!ProfessorRole class methodsFor: 'instance creation' stamp: 'IvanRyant 10/8/2013 21:34'!person: aPerson		^(super new)		initialize: aPerson;		yourself! !Object subclass: #ResearchGroup	instanceVariableNames: 'name membershipsSet'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!ResearchGroup commentStamp: '<historical>' prior: 0!ResearchGroup.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

ATTENTION: Do neither add nor remove entries in the membershipsSet collection without proper replication!! The membershipsSet collection is just a contradirectional replica of researchRelators and is kept consistent with them by the respective add and remove methods of ResearchRole and StudentRole objects."

Note: the membershipsSet instance variable keeps references to members of the research group. The collection must be updated every time when one of the researchRelators gets changed. That data replication is an alternative solution to a method, which would have to query the system with a complicated and difficult navigation, like e.g. Department>>taughtSubjects (there the difficult navigation has been chosen). Here the navigation would be much more difficult, since it requires:
- selecting the research group of our interest
- construction of a temporary collection containing all students with their research groups
- construction of a temporary collection containing all researchers with their research groups
- selecting the students and researchers, who belong to the selected research group, from the union of both temporary collections"

Constraints: None
!!ResearchGroup methodsFor: 'accessing' stamp: 'IvanRyant 10/8/2013 22:20'!membershipsCol
	"This collection is just a contradirectional replica of researchRelators."
	
	^self membershipsSet asSortedCollection: [:a :b | a name <= b name]	"

Note: the membershipsSet instance variable keeps references to members of the research group. The collection must be updated every time when one of the researchRelators gets changed. That data replication is an alternative solution to a method, which would have to query the system with a complicated and difficult navigation, like e.g. Department>>taughtSubjects (there the difficult navigation has been chosen). Here the navigation would be much more difficult, since it requires:
- selecting the research group of our interest
- construction of a temporary collection containing all students with their research groups
- construction of a temporary collection containing all researchers with their research groups
- selecting the students and researchers, who belong to the selected research group, from the union of both temporary collections"! !!ResearchGroup methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!membershipsSet
	"This is accessor with lazy initialization of the collection.
	ATTENTION: Consider using membershipsCol instead of this method!! This method is intended to be used only privately in ResearchGroup objects and by ResearcherRole and StudentRole objects. The membershipsSet collection is just a contradirectional replica of researchRelators. Do neither add nor remove entries in this collection without proper replication!!"
	
	^membershipsSet ifNil: [membershipsSet := Set new]	"

Note: the membershipsSet instance variable keeps references to members of the research group. The collection must be updated every time when one of the researchRelators gets changed. That data replication is an alternative solution to a method, which would have to query the system with a complicated and difficult navigation, like e.g. Department>>taughtSubjects (there the difficult navigation has been chosen). Here the navigation would be much more difficult, since it requires:
- selecting the research group of our interest
- construction of a temporary collection containing all students with their research groups
- construction of a temporary collection containing all researchers with their research groups
- selecting the students and researchers, who belong to the selected research group, from the union of both temporary collections"! !!ResearchGroup methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name
	
	^name! !!ResearchGroup methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name: anObject
	
	name := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ResearchGroup class	instanceVariableNames: ''!!ResearchGroup class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^super new initialize! !ResearchMembershipRelator subclass: #ProfessorsResearchMembershipRelator	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!ProfessorsResearchMembershipRelator commentStamp: '<historical>' prior: 0!ProfessorsResearchMembershipRelator.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Constraints: None
!Object subclass: #SubjectGuarantorRole	instanceVariableNames: 'startDate'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!SubjectGuarantorRole commentStamp: '<historical>' prior: 0!SubjectGuarantorRole.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	startDate	<Date>	description of startDate

Constraints: None
!!SubjectGuarantorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate
	
	^startDate ifNil: [startDate := Date today]! !!SubjectGuarantorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate: anObject
	
	startDate := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!SubjectGuarantorRole class	instanceVariableNames: ''!!SubjectGuarantorRole class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^super new initialize! !Object subclass: #Person	instanceVariableNames: 'titlesBefore name titlesAfter dateOfBirth'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!Person commentStamp: '<historical>' prior: 0!Person.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables
	rolesCol	<OrderedCollection>	description of rolesCol
	name   	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of surname
	titlesAfter	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of titlesAfter
	titlesBefore	<Announcement | AnnouncementSet | ExceptionSet | GenericException | GlorpExpression | GRPrinter | Join | LensContainer | LensExpressionSurrogate | SequenceableCollection | Signal | SortFunction | URLwithPath | WAExceptionHandler | WAExceptionHandler>	description of titlesBefore	dateOfBirth 	<DateTime>	description of dateOfBirth

Constraints:

None.
!!Person methodsFor: 'accessing' stamp: 'IvanRyant 10/16/2013 22:56'!dateOfBirth	^dateOfBirth! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 10/16/2013 22:57'!dateOfBirth: anObject	dateOfBirth := anObject! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name

	^name! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!name: anObject

	name := anObject! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!nameWithTitles
	
	^self titlesBefore , ' ' , self name, ' ' , self titlesAfter! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesAfter

	^titlesAfter! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesAfter: anObject

	titlesAfter := anObject! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesBefore

	^titlesBefore! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesBefore: anObject

	titlesBefore := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Person class	instanceVariableNames: ''!!Person class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."

	^super new initialize! !'From Pharo2.0 of 7 March 2013 [Latest update: #20619] on 17 October 2013 at 12:42:52 am'!!Collection methodsFor: '*semestralka-uni' stamp: 'IvanRyant 10/17/2013 00:30'!flatCollect: aBlock	"Evaluate aBlock with each of the values of the receiver as the  	argument -- each argument must be a collection.  Collect the resulting values into a collection that is like 	the receiver.  Answer the new collection."		| newCollection |	newCollection := self species new.	self do: [:each | newCollection addAll: (aBlock value: each)].	^newCollection! !