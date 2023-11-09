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
import 'app/database/models/comment.dart';
import 'app/database/models/metadata.dart';
import 'app/database/models/resource_model.dart';
import 'app/database/models/tag.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 8248204990099429406),
      name: 'Annotation',
      lastPropertyId: const IdUid(12, 4807803630161972398),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6257851605915656083),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2911682090479067511),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 9085424665909237401),
            name: 'keyWords',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4869164249911040981),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4537281218644058175),
            name: 'modifiedDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7432922768966538681),
            name: 'resourceId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 8968142865902978357),
            relationTarget: 'ResourceModel'),
        ModelProperty(
            id: const IdUid(9, 8331238368741889284),
            name: 'annoLocation',
            type: 29,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 1821406228020511976),
            name: 'commentId',
            type: 11,
            flags: 520,
            indexId: const IdUid(6, 2954430150247302611),
            relationTarget: 'Comment'),
        ModelProperty(
            id: const IdUid(12, 4807803630161972398),
            name: 'dbColor',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 6923373494171050244),
            name: 'backlinks',
            targetId: const IdUid(1, 8248204990099429406))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 7215945279805285914),
      name: 'Metadata',
      lastPropertyId: const IdUid(5, 2306406660106987452),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 386412920356514914),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5184479599504940744),
            name: 'authours',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2508204788101926549),
            name: 'published',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3693569524275523637),
            name: 'publisher',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2306406660106987452),
            name: 'resourceId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 6694350154418787491),
            relationTarget: 'ResourceModel')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 4109849702745454960),
      name: 'ResourceModel',
      lastPropertyId: const IdUid(7, 7369379352859169486),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3576280008256436632),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 676059336318277615),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2427956517700911657),
            name: 'customName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6944515626103696103),
            name: 'filePath',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6363098222944715000),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4800053596555886445),
            name: 'modifiedDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7369379352859169486),
            name: 'metadataId',
            type: 11,
            flags: 520,
            indexId: const IdUid(5, 1720603989783748426),
            relationTarget: 'Metadata')
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(2, 5844204696709590591),
            name: 'annotations',
            targetId: const IdUid(1, 8248204990099429406)),
        ModelRelation(
            id: const IdUid(3, 3597498948616981604),
            name: 'tags',
            targetId: const IdUid(5, 8549396755358312848))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 8549396755358312848),
      name: 'Tag',
      lastPropertyId: const IdUid(3, 5069005284069945164),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5678071039353668765),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3949013145579953731),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5069005284069945164),
            name: 'color',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(4, 8346971367855664503),
            name: 'resources',
            targetId: const IdUid(4, 4109849702745454960)),
        ModelRelation(
            id: const IdUid(5, 1953413206913352229),
            name: 'annotations',
            targetId: const IdUid(1, 8248204990099429406))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(7, 6137702185814852847),
      name: 'Comment',
      lastPropertyId: const IdUid(4, 3825512618922583635),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2716506071694547707),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 9088051527749048036),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1277858262175100193),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3825512618922583635),
            name: 'modifiedDate',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
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
      lastEntityId: const IdUid(7, 6137702185814852847),
      lastIndexId: const IdUid(6, 2954430150247302611),
      lastRelationId: const IdUid(5, 1953413206913352229),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [597770737609656693, 2657955787335229915],
      retiredIndexUids: const [4892981388347643264, 2686495519677825834],
      retiredPropertyUids: const [
        5460684269534598927,
        7241362272138008483,
        1043726643665298655,
        9022690092654126091,
        621637047420169961,
        6272359716375395534,
        7197696914112980098
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Annotation: EntityDefinition<Annotation>(
        model: _entities[0],
        toOneRelations: (Annotation object) =>
            [object.resource, object.comment],
        toManyRelations: (Annotation object) =>
            {RelInfo<Annotation>.toMany(1, object.id!): object.backlinks},
        getId: (Annotation object) => object.id,
        setId: (Annotation object, int id) {
          object.id = id;
        },
        objectToFB: (Annotation object, fb.Builder fbb) {
          final textOffset = fbb.writeString(object.text);
          final keyWordsOffset = fbb.writeString(object.keyWords);
          final annoLocationOffset = fbb.writeListFloat64(object.annoLocation);
          fbb.startTable(13);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, textOffset);
          fbb.addOffset(2, keyWordsOffset);
          fbb.addInt64(3, object.createdDate.millisecondsSinceEpoch);
          fbb.addInt64(4, object.modifiedDate.millisecondsSinceEpoch);
          fbb.addInt64(6, object.resource.targetId);
          fbb.addOffset(8, annoLocationOffset);
          fbb.addInt64(10, object.comment.targetId);
          fbb.addInt64(11, object.dbColor);
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
          final annoLocationParam =
              const fb.ListReader<double>(fb.Float64Reader(), lazy: false)
                  .vTableGet(buffer, rootOffset, 20, []);
          final object = Annotation(
              id: idParam,
              text: textParam,
              keyWords: keyWordsParam,
              createdDate: createdDateParam,
              modifiedDate: modifiedDateParam,
              annoLocation: annoLocationParam)
            ..dbColor =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 26, 0);
          object.resource.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.resource.attach(store);
          object.comment.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 24, 0);
          object.comment.attach(store);
          InternalToManyAccess.setRelInfo<Annotation>(object.backlinks, store,
              RelInfo<Annotation>.toMany(1, object.id!));
          return object;
        }),
    Metadata: EntityDefinition<Metadata>(
        model: _entities[1],
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
          fbb.addInt64(2, object.published?.millisecondsSinceEpoch);
          fbb.addOffset(3, publisherOffset);
          fbb.addInt64(4, object.resource.targetId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final publishedValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
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
              .vTableGetNullable(buffer, rootOffset, 10);
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
        model: _entities[2],
        toOneRelations: (ResourceModel object) => [object.metadata],
        toManyRelations: (ResourceModel object) => {
              RelInfo<ResourceModel>.toMany(2, object.id!): object.annotations,
              RelInfo<ResourceModel>.toMany(3, object.id!): object.tags
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
          InternalToManyAccess.setRelInfo<ResourceModel>(object.annotations,
              store, RelInfo<ResourceModel>.toMany(2, object.id!));
          InternalToManyAccess.setRelInfo<ResourceModel>(
              object.tags, store, RelInfo<ResourceModel>.toMany(3, object.id!));
          return object;
        }),
    Tag: EntityDefinition<Tag>(
        model: _entities[3],
        toOneRelations: (Tag object) => [],
        toManyRelations: (Tag object) => {
              RelInfo<Tag>.toMany(4, object.id!): object.resources,
              RelInfo<Tag>.toMany(5, object.id!): object.annotations
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
          InternalToManyAccess.setRelInfo<Tag>(
              object.resources, store, RelInfo<Tag>.toMany(4, object.id!));
          InternalToManyAccess.setRelInfo<Tag>(
              object.annotations, store, RelInfo<Tag>.toMany(5, object.id!));
          return object;
        }),
    Comment: EntityDefinition<Comment>(
        model: _entities[4],
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

  /// see [Annotation.resource]
  static final resource =
      QueryRelationToOne<Annotation, ResourceModel>(_entities[0].properties[5]);

  /// see [Annotation.annoLocation]
  static final annoLocation =
      QueryDoubleVectorProperty<Annotation>(_entities[0].properties[6]);

  /// see [Annotation.comment]
  static final comment =
      QueryRelationToOne<Annotation, Comment>(_entities[0].properties[7]);

  /// see [Annotation.dbColor]
  static final dbColor =
      QueryIntegerProperty<Annotation>(_entities[0].properties[8]);

  /// see [Annotation.backlinks]
  static final backlinks =
      QueryRelationToMany<Annotation, Annotation>(_entities[0].relations[0]);
}

/// [Metadata] entity fields to define ObjectBox queries.
class Metadata_ {
  /// see [Metadata.id]
  static final id = QueryIntegerProperty<Metadata>(_entities[1].properties[0]);

  /// see [Metadata.authours]
  static final authours =
      QueryStringVectorProperty<Metadata>(_entities[1].properties[1]);

  /// see [Metadata.published]
  static final published =
      QueryIntegerProperty<Metadata>(_entities[1].properties[2]);

  /// see [Metadata.publisher]
  static final publisher =
      QueryStringProperty<Metadata>(_entities[1].properties[3]);

  /// see [Metadata.resource]
  static final resource =
      QueryRelationToOne<Metadata, ResourceModel>(_entities[1].properties[4]);
}

/// [ResourceModel] entity fields to define ObjectBox queries.
class ResourceModel_ {
  /// see [ResourceModel.id]
  static final id =
      QueryIntegerProperty<ResourceModel>(_entities[2].properties[0]);

  /// see [ResourceModel.name]
  static final name =
      QueryStringProperty<ResourceModel>(_entities[2].properties[1]);

  /// see [ResourceModel.customName]
  static final customName =
      QueryStringProperty<ResourceModel>(_entities[2].properties[2]);

  /// see [ResourceModel.filePath]
  static final filePath =
      QueryStringProperty<ResourceModel>(_entities[2].properties[3]);

  /// see [ResourceModel.createdDate]
  static final createdDate =
      QueryIntegerProperty<ResourceModel>(_entities[2].properties[4]);

  /// see [ResourceModel.modifiedDate]
  static final modifiedDate =
      QueryIntegerProperty<ResourceModel>(_entities[2].properties[5]);

  /// see [ResourceModel.metadata]
  static final metadata =
      QueryRelationToOne<ResourceModel, Metadata>(_entities[2].properties[6]);

  /// see [ResourceModel.annotations]
  static final annotations =
      QueryRelationToMany<ResourceModel, Annotation>(_entities[2].relations[0]);

  /// see [ResourceModel.tags]
  static final tags =
      QueryRelationToMany<ResourceModel, Tag>(_entities[2].relations[1]);
}

/// [Tag] entity fields to define ObjectBox queries.
class Tag_ {
  /// see [Tag.id]
  static final id = QueryIntegerProperty<Tag>(_entities[3].properties[0]);

  /// see [Tag.name]
  static final name = QueryStringProperty<Tag>(_entities[3].properties[1]);

  /// see [Tag.color]
  static final color = QueryIntegerProperty<Tag>(_entities[3].properties[2]);

  /// see [Tag.resources]
  static final resources =
      QueryRelationToMany<Tag, ResourceModel>(_entities[3].relations[0]);

  /// see [Tag.annotations]
  static final annotations =
      QueryRelationToMany<Tag, Annotation>(_entities[3].relations[1]);
}

/// [Comment] entity fields to define ObjectBox queries.
class Comment_ {
  /// see [Comment.id]
  static final id = QueryIntegerProperty<Comment>(_entities[4].properties[0]);

  /// see [Comment.text]
  static final text = QueryStringProperty<Comment>(_entities[4].properties[1]);

  /// see [Comment.createdDate]
  static final createdDate =
      QueryIntegerProperty<Comment>(_entities[4].properties[2]);

  /// see [Comment.modifiedDate]
  static final modifiedDate =
      QueryIntegerProperty<Comment>(_entities[4].properties[3]);
}
