// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'app/database/models/annotation.dart';
import 'app/database/models/annotation_bounds.dart';
import 'app/database/models/comment.dart';
import 'app/database/models/metadata.dart';
import 'app/database/models/resource_model.dart';
import 'app/database/models/tag.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 255422657766095430),
      name: 'Annotation',
      lastPropertyId: const IdUid(10, 2125350795245271697),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1470332273806621886),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8846884886197171536),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4647208103369138203),
            name: 'keyWords',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2938038331510127824),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3073630183046665211),
            name: 'modifiedDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 6112586062110525557),
            name: 'page',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 256003567430513667),
            name: 'boundsId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 4698580310966882293),
            relationTarget: 'AnnotationBounds'),
        ModelProperty(
            id: const IdUid(8, 4461189440832003183),
            name: 'commentId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 8048015735431317774),
            relationTarget: 'Comment'),
        ModelProperty(
            id: const IdUid(9, 4444547569854857249),
            name: 'resourceId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 9035107448898502190),
            relationTarget: 'ResourceModel'),
        ModelProperty(
            id: const IdUid(10, 2125350795245271697),
            name: 'dbColor',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(5, 5568575507595909257),
            name: 'outlinks',
            targetId: const IdUid(1, 255422657766095430)),
        ModelRelation(
            id: const IdUid(6, 5747837663004442255),
            name: 'tag',
            targetId: const IdUid(6, 7745127723979849109))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 1893028717859675425),
      name: 'AnnotationBounds',
      lastPropertyId: const IdUid(5, 5195688976911541905),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 570076536851840589),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 171652712069528447),
            name: 'xOffset1',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1365470770016335684),
            name: 'xOffset2',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2393150372184725559),
            name: 'yOffset1',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5195688976911541905),
            name: 'yOffset2',
            type: 8,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 2705502167124870525),
      name: 'Comment',
      lastPropertyId: const IdUid(4, 4125960924849100428),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3475118411054731017),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8403184289230061001),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 859023310915854248),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4125960924849100428),
            name: 'modifiedDate',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 9010685457694032360),
      name: 'Metadata',
      lastPropertyId: const IdUid(5, 9030696834924742079),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3809232704125036735),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8317846409275976734),
            name: 'authours',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1289404860367606388),
            name: 'publisher',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8162993748655638537),
            name: 'published',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 9030696834924742079),
            name: 'resourceId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 2885352526544933267),
            relationTarget: 'ResourceModel')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 4066299863724318362),
      name: 'ResourceModel',
      lastPropertyId: const IdUid(7, 4888643812190865875),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8671136077272361796),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5006605948144387776),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1438427701059052930),
            name: 'customName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3832043596242740024),
            name: 'filePath',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3162488193741356555),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 79557407714511038),
            name: 'modifiedDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4888643812190865875),
            name: 'metadataId',
            type: 11,
            flags: 520,
            indexId: const IdUid(5, 4267648960968033182),
            relationTarget: 'Metadata')
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(7, 736704424284867315),
            name: 'tags',
            targetId: const IdUid(6, 7745127723979849109))
      ],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'annotations', srcEntity: 'Annotation', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(6, 7745127723979849109),
      name: 'Tag',
      lastPropertyId: const IdUid(3, 6491802480317500378),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2525504400457546943),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8490710103996500503),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6491802480317500378),
            name: 'color',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'resources', srcEntity: 'ResourceModel', srcField: ''),
        ModelBacklink(
            name: 'annotations', srcEntity: 'Annotation', srcField: '')
      ])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(6, 7745127723979849109),
      lastIndexId: const IdUid(5, 4267648960968033182),
      lastRelationId: const IdUid(7, 736704424284867315),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [
        6282465596016082636,
        6045032964059790288,
        4107451646589352694,
        7132129752650486374
      ],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Annotation: EntityDefinition<Annotation>(
        model: _entities[0],
        toOneRelations: (Annotation object) =>
            [object.bounds, object.comment, object.resource],
        toManyRelations: (Annotation object) => {
              RelInfo<Annotation>.toMany(5, object.id!): object.outlinks,
              RelInfo<Annotation>.toMany(6, object.id!): object.tag
            },
        getId: (Annotation object) => object.id,
        setId: (Annotation object, int id) {
          object.id = id;
        },
        objectToFB: (Annotation object, fb.Builder fbb) {
          final textOffset = fbb.writeString(object.text);
          final keyWordsOffset = fbb.writeString(object.keyWords);
          fbb.startTable(11);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, textOffset);
          fbb.addOffset(2, keyWordsOffset);
          fbb.addInt64(3, object.createdDate.millisecondsSinceEpoch);
          fbb.addInt64(4, object.modifiedDate.millisecondsSinceEpoch);
          fbb.addInt64(5, object.page);
          fbb.addInt64(6, object.bounds.targetId);
          fbb.addInt64(7, object.comment.targetId);
          fbb.addInt64(8, object.resource.targetId);
          fbb.addInt64(9, object.dbColor);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final textParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final keyWordsParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final createdDateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          final modifiedDateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));
          final pageParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final object = Annotation(
              id: idParam,
              text: textParam,
              keyWords: keyWordsParam,
              createdDate: createdDateParam,
              modifiedDate: modifiedDateParam,
              page: pageParam)
            ..dbColor =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 22, 0);
          object.bounds.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.bounds.attach(store);
          object.comment.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);
          object.comment.attach(store);
          object.resource.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0);
          object.resource.attach(store);
          InternalToManyAccess.setRelInfo<Annotation>(object.outlinks, store,
              RelInfo<Annotation>.toMany(5, object.id!));
          InternalToManyAccess.setRelInfo<Annotation>(
              object.tag, store, RelInfo<Annotation>.toMany(6, object.id!));
          return object;
        }),
    AnnotationBounds: EntityDefinition<AnnotationBounds>(
        model: _entities[1],
        toOneRelations: (AnnotationBounds object) => [],
        toManyRelations: (AnnotationBounds object) => {},
        getId: (AnnotationBounds object) => object.id,
        setId: (AnnotationBounds object, int id) {
          object.id = id;
        },
        objectToFB: (AnnotationBounds object, fb.Builder fbb) {
          fbb.startTable(6);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addFloat64(1, object.xOffset1);
          fbb.addFloat64(2, object.xOffset2);
          fbb.addFloat64(3, object.yOffset1);
          fbb.addFloat64(4, object.yOffset2);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final xOffset1Param =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final xOffset2Param =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final yOffset1Param =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final yOffset2Param =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final object = AnnotationBounds(
              id: idParam,
              xOffset1: xOffset1Param,
              xOffset2: xOffset2Param,
              yOffset1: yOffset1Param,
              yOffset2: yOffset2Param);

          return object;
        }),
    Comment: EntityDefinition<Comment>(
        model: _entities[2],
        toOneRelations: (Comment object) => [],
        toManyRelations: (Comment object) => {},
        getId: (Comment object) => object.id,
        setId: (Comment object, int id) {
          object.id = id;
        },
        objectToFB: (Comment object, fb.Builder fbb) {
          final textOffset = fbb.writeString(object.text);
          fbb.startTable(5);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, textOffset);
          fbb.addInt64(2, object.createdDate.millisecondsSinceEpoch);
          fbb.addInt64(3, object.modifiedDate.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final textParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final createdDateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0));
          final modifiedDateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          final object = Comment(
              id: idParam,
              text: textParam,
              createdDate: createdDateParam,
              modifiedDate: modifiedDateParam);

          return object;
        }),
    Metadata: EntityDefinition<Metadata>(
        model: _entities[3],
        toOneRelations: (Metadata object) => [object.resource],
        toManyRelations: (Metadata object) => {},
        getId: (Metadata object) => object.id,
        setId: (Metadata object, int id) {
          object.id = id;
        },
        objectToFB: (Metadata object, fb.Builder fbb) {
          final authoursOffset = object.authours == null
              ? null
              : fbb.writeList(object.authours!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final publisherOffset = object.publisher == null
              ? null
              : fbb.writeString(object.publisher!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, authoursOffset);
          fbb.addOffset(2, publisherOffset);
          fbb.addInt64(3, object.published?.millisecondsSinceEpoch);
          fbb.addInt64(4, object.resource.targetId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final publishedValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final authoursParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGetNullable(buffer, rootOffset, 6);
          final publishedParam = publishedValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(publishedValue);
          final publisherParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final object = Metadata(
              id: idParam,
              authours: authoursParam,
              published: publishedParam,
              publisher: publisherParam);
          object.resource.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.resource.attach(store);
          return object;
        }),
    ResourceModel: EntityDefinition<ResourceModel>(
        model: _entities[4],
        toOneRelations: (ResourceModel object) => [object.metadata],
        toManyRelations: (ResourceModel object) => {
              RelInfo<ResourceModel>.toMany(7, object.id!): object.tags,
              RelInfo<Annotation>.toOneBacklink(9, object.id!,
                      (Annotation srcObject) => srcObject.resource):
                  object.annotations
            },
        getId: (ResourceModel object) => object.id,
        setId: (ResourceModel object, int id) {
          object.id = id;
        },
        objectToFB: (ResourceModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final customNameOffset = fbb.writeString(object.customName);
          final filePathOffset = fbb.writeString(object.filePath);
          fbb.startTable(8);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, customNameOffset);
          fbb.addOffset(3, filePathOffset);
          fbb.addInt64(4, object.createdDate.millisecondsSinceEpoch);
          fbb.addInt64(5, object.modifiedDate.millisecondsSinceEpoch);
          fbb.addInt64(6, object.metadata.targetId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final customNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final filePathParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final createdDateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));
          final modifiedDateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0));
          final object = ResourceModel(
              id: idParam,
              name: nameParam,
              customName: customNameParam,
              filePath: filePathParam,
              createdDate: createdDateParam,
              modifiedDate: modifiedDateParam);
          object.metadata.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.metadata.attach(store);
          InternalToManyAccess.setRelInfo<ResourceModel>(
              object.tags, store, RelInfo<ResourceModel>.toMany(7, object.id!));
          InternalToManyAccess.setRelInfo<ResourceModel>(
              object.annotations,
              store,
              RelInfo<Annotation>.toOneBacklink(
                  9, object.id!, (Annotation srcObject) => srcObject.resource));
          return object;
        }),
    Tag: EntityDefinition<Tag>(
        model: _entities[5],
        toOneRelations: (Tag object) => [],
        toManyRelations: (Tag object) => {
              RelInfo<ResourceModel>.toManyBacklink(7, object.id!):
                  object.resources,
              RelInfo<Annotation>.toManyBacklink(6, object.id!):
                  object.annotations
            },
        getId: (Tag object) => object.id,
        setId: (Tag object, int id) {
          object.id = id;
        },
        objectToFB: (Tag object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(4);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.color);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final colorParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final object = Tag(id: idParam, name: nameParam, color: colorParam);
          InternalToManyAccess.setRelInfo<Tag>(object.resources, store,
              RelInfo<ResourceModel>.toManyBacklink(7, object.id!));
          InternalToManyAccess.setRelInfo<Tag>(object.annotations, store,
              RelInfo<Annotation>.toManyBacklink(6, object.id!));
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Annotation] entity fields to define ObjectBox queries.
class Annotation_ {
  /// see [Annotation.id]
  static final id =
      QueryIntegerProperty<Annotation>(_entities[0].properties[0]);

  /// see [Annotation.text]
  static final text =
      QueryStringProperty<Annotation>(_entities[0].properties[1]);

  /// see [Annotation.keyWords]
  static final keyWords =
      QueryStringProperty<Annotation>(_entities[0].properties[2]);

  /// see [Annotation.createdDate]
  static final createdDate =
      QueryIntegerProperty<Annotation>(_entities[0].properties[3]);

  /// see [Annotation.modifiedDate]
  static final modifiedDate =
      QueryIntegerProperty<Annotation>(_entities[0].properties[4]);

  /// see [Annotation.page]
  static final page =
      QueryIntegerProperty<Annotation>(_entities[0].properties[5]);

  /// see [Annotation.bounds]
  static final bounds = QueryRelationToOne<Annotation, AnnotationBounds>(
      _entities[0].properties[6]);

  /// see [Annotation.comment]
  static final comment =
      QueryRelationToOne<Annotation, Comment>(_entities[0].properties[7]);

  /// see [Annotation.resource]
  static final resource =
      QueryRelationToOne<Annotation, ResourceModel>(_entities[0].properties[8]);

  /// see [Annotation.dbColor]
  static final dbColor =
      QueryIntegerProperty<Annotation>(_entities[0].properties[9]);

  /// see [Annotation.outlinks]
  static final outlinks =
      QueryRelationToMany<Annotation, Annotation>(_entities[0].relations[0]);

  /// see [Annotation.tag]
  static final tag =
      QueryRelationToMany<Annotation, Tag>(_entities[0].relations[1]);
}

/// [AnnotationBounds] entity fields to define ObjectBox queries.
class AnnotationBounds_ {
  /// see [AnnotationBounds.id]
  static final id =
      QueryIntegerProperty<AnnotationBounds>(_entities[1].properties[0]);

  /// see [AnnotationBounds.xOffset1]
  static final xOffset1 =
      QueryDoubleProperty<AnnotationBounds>(_entities[1].properties[1]);

  /// see [AnnotationBounds.xOffset2]
  static final xOffset2 =
      QueryDoubleProperty<AnnotationBounds>(_entities[1].properties[2]);

  /// see [AnnotationBounds.yOffset1]
  static final yOffset1 =
      QueryDoubleProperty<AnnotationBounds>(_entities[1].properties[3]);

  /// see [AnnotationBounds.yOffset2]
  static final yOffset2 =
      QueryDoubleProperty<AnnotationBounds>(_entities[1].properties[4]);
}

/// [Comment] entity fields to define ObjectBox queries.
class Comment_ {
  /// see [Comment.id]
  static final id = QueryIntegerProperty<Comment>(_entities[2].properties[0]);

  /// see [Comment.text]
  static final text = QueryStringProperty<Comment>(_entities[2].properties[1]);

  /// see [Comment.createdDate]
  static final createdDate =
      QueryIntegerProperty<Comment>(_entities[2].properties[2]);

  /// see [Comment.modifiedDate]
  static final modifiedDate =
      QueryIntegerProperty<Comment>(_entities[2].properties[3]);
}

/// [Metadata] entity fields to define ObjectBox queries.
class Metadata_ {
  /// see [Metadata.id]
  static final id = QueryIntegerProperty<Metadata>(_entities[3].properties[0]);

  /// see [Metadata.authours]
  static final authours =
      QueryStringVectorProperty<Metadata>(_entities[3].properties[1]);

  /// see [Metadata.publisher]
  static final publisher =
      QueryStringProperty<Metadata>(_entities[3].properties[2]);

  /// see [Metadata.published]
  static final published =
      QueryIntegerProperty<Metadata>(_entities[3].properties[3]);

  /// see [Metadata.resource]
  static final resource =
      QueryRelationToOne<Metadata, ResourceModel>(_entities[3].properties[4]);
}

/// [ResourceModel] entity fields to define ObjectBox queries.
class ResourceModel_ {
  /// see [ResourceModel.id]
  static final id =
      QueryIntegerProperty<ResourceModel>(_entities[4].properties[0]);

  /// see [ResourceModel.name]
  static final name =
      QueryStringProperty<ResourceModel>(_entities[4].properties[1]);

  /// see [ResourceModel.customName]
  static final customName =
      QueryStringProperty<ResourceModel>(_entities[4].properties[2]);

  /// see [ResourceModel.filePath]
  static final filePath =
      QueryStringProperty<ResourceModel>(_entities[4].properties[3]);

  /// see [ResourceModel.createdDate]
  static final createdDate =
      QueryIntegerProperty<ResourceModel>(_entities[4].properties[4]);

  /// see [ResourceModel.modifiedDate]
  static final modifiedDate =
      QueryIntegerProperty<ResourceModel>(_entities[4].properties[5]);

  /// see [ResourceModel.metadata]
  static final metadata =
      QueryRelationToOne<ResourceModel, Metadata>(_entities[4].properties[6]);

  /// see [ResourceModel.tags]
  static final tags =
      QueryRelationToMany<ResourceModel, Tag>(_entities[4].relations[0]);
}

/// [Tag] entity fields to define ObjectBox queries.
class Tag_ {
  /// see [Tag.id]
  static final id = QueryIntegerProperty<Tag>(_entities[5].properties[0]);

  /// see [Tag.name]
  static final name = QueryStringProperty<Tag>(_entities[5].properties[1]);

  /// see [Tag.color]
  static final color = QueryIntegerProperty<Tag>(_entities[5].properties[2]);
}
