eval
eval: anExpr env: anEnv o: aVal type: aClauses
		^ ((aClauses includes: #quote) ifTrue: SKGoal fail ifFalse: [ self quote: anExpr o: aVal ]) |
				((((aClauses includes: #list) ifTrue: SKGoal fail ifFalse: [ self list: anExpr env: anEnv o: aVal ]) |
					(((aClauses includes: #lookup) ifTrue: SKGoal fail ifFalse: [ self lookup: anExpr env: anEnv o: aVal ]))) |
				(((aClauses includes: #lambda) ifTrue: SKGoal fail ifFalse: [ self lambda: anExpr env: anEnv o: aVal ]) |
					((aClauses includes: #apply) ifTrue: SKGoal fail ifFalse: [ self apply: anExpr env: anEnv o: aVal type: aClauses ]))).
	